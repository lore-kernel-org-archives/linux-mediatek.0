From: Sean Wang <sean.wang@mediatek.com>
Subject: Re: [PATCH net-next 2/3] net: dsa: mediatek: combine MediaTek tag
 with VLAN tag
Date: Tue, 12 Dec 2017 15:21:21 +0800
Message-ID: <1513063281.28444.25.camel@mtkswgap22>
References: <cover.1512625814.git.sean.wang@mediatek.com>
         <dffc711dc88898f8a5f5387d1fa7d14e0faf9ed5.1512625814.git.sean.wang@mediatek.com>
         <20171207153016.GC24750@lunn.ch>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20171207153016.GC24750@lunn.ch>
Sender: linux-kernel-owner@vger.kernel.org
To: Andrew Lunn <andrew@lunn.ch>
Cc: davem@davemloft.net, f.fainelli@gmail.com, vivien.didelot@savoirfairelinux.com, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org
List-Id: linux-mediatek@lists.infradead.org

On Thu, 2017-12-07 at 16:30 +0100, Andrew Lunn wrote:
> > @@ -25,20 +28,37 @@ static struct sk_buff *mtk_tag_xmit(struct sk_buff *skb,
> >  {
> >  	struct dsa_port *dp = dsa_slave_to_port(dev);
> >  	u8 *mtk_tag;
> > +	bool is_vlan_skb = true;
> 
> ..
> 
> > +	/* Mark tag attribute on special tag insertion to notify hardware
> > +	 * whether that's a combined special tag with 802.1Q header.
> > +	 */
> > +	mtk_tag[0] = is_vlan_skb ? MTK_HDR_XMIT_TAGGED_TPID_8100 :
> > +		     MTK_HDR_XMIT_UNTAGGED;
> >  	mtk_tag[1] = (1 << dp->index) & MTK_HDR_XMIT_DP_BIT_MASK;
> > -	mtk_tag[2] = 0;
> > -	mtk_tag[3] = 0;
> > +
> > +	/* Tag control information is kept for 802.1Q */
> > +	if (!is_vlan_skb) {
> > +		mtk_tag[2] = 0;
> > +		mtk_tag[3] = 0;
> > +	}
> >  
> >  	return skb;
> >  }
> 
> Hi Sean
> 
> So you can mark a packet for egress. What about ingress? How do you
> know the VLAN/PORT combination for packets the CPU receives? I would
> of expected a similar change to mtk_tag_rcv().
> 
>    Andrew

Hi, Andrew

It's unnecessary for extra handling in mtk_tag_rcv() when VLAN tag is
present since it is able to put the VLAN tag after the special tag and
then follow the existing way to parse.

	Sean
