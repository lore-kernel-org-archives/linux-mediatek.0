Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D12EC6FD1D
	for <linux-mediatek@archiver.kernel.org>; Mon, 27 Mar 2023 21:59:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:Subject
	:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=m3Nxnw2EJKi8PgND390b4ttccCknFAa+VCeuBtlni8M=; b=DkurlC1LV87UKQ
	K+WLumy1iUqbt98vMOBvmjBpj2sv5DB9OjgL5A2WvovO5JWNGZu6N8JBnQffHrBSyxOzn739kRT9F
	rHiF/3nbXI22VtR8NBO0v+XEZV11UfVnGcvFu4HMQnA8Xf4yM6myFsIKGLjhYI2m+MnspfqjQ99aU
	qVBineAtj05AKpXAK5qQsRD/8kTgp7YScidNZnxLqWmnlOmP7ft/FSwWCWYEneb1xYuYnPZHYbwYc
	4TAdDIA0Tnb3XqO83K0P67gPPaHwOZJjfe1Uds4L1hbyq3xwTK1xde5qDiMzv4LCZ9blo6dDVAHZ0
	C34FmVluEylcZ/bnHYVQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pgurh-00CTeg-07;
	Mon, 27 Mar 2023 21:58:57 +0000
Received: from sender4-op-o10.zoho.com ([136.143.188.10])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pgurc-00CTe2-1G;
	Mon, 27 Mar 2023 21:58:53 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1679954286; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=anV16UVMtNp/NW2ItYLiRB4AQ1SLN50vfbExP7irbCMV9YCnPN8JgnZff1N4KZ4OCApLXdn/m/9f1OKbZRLTniTMpR0AeV9WVbxb88/xdMM5opnS2lF1cpi0s7NDNV9t0JUItFQaoKsCvj0bf0qwd9tB8WCVYOGC7y0oEC52xao=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1679954286; h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:To; 
	bh=m3Nxnw2EJKi8PgND390b4ttccCknFAa+VCeuBtlni8M=; 
	b=F99QbKOhBuUMdCEMnGaJw5EdSw2SS4kCm822f0A913FJ4g3N0PXHDdc70fCskgcCR1Pb0KZ7Znobd572rOywpd3Dt86MZ3S7v1dy3ewywfxnw1IlyAXhVhlscqLGVyND4piXdfLuqVa8Tn7lIpw95yyjChuhNZpeL6BoIIu5B2o=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=arinc9.com;
	spf=pass  smtp.mailfrom=arinc.unal@arinc9.com;
	dmarc=pass header.from=<arinc.unal@arinc9.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1679954286;
	s=zmail; d=arinc9.com; i=arinc.unal@arinc9.com;
	h=Message-ID:Date:Date:MIME-Version:Subject:Subject:To:To:Cc:Cc:References:From:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=m3Nxnw2EJKi8PgND390b4ttccCknFAa+VCeuBtlni8M=;
	b=ciE8XK1PKqy/bE+GnsMM82LHIa2TtViiZ1rMMxc0lyZi2Wde8VL628n6LTpIyEgK
	ETSgndvMVoSDkOx8t99wmW5jnfweSGjh+yza1K3XxQzaJ3ZhM9ChFTJIpqJI0ncSlFR
	CfeKkCTQr0Azx2Qy12XWLcb+6ofC0oS1/EZErJus=
Received: from [10.10.10.3] (149.91.1.15 [149.91.1.15]) by mx.zohomail.com
	with SMTPS id 1679954284745209.8283533930612; Mon, 27 Mar 2023 14:58:04 -0700 (PDT)
Message-ID: <8450084e-1474-17fa-32c2-a4653b74ff17@arinc9.com>
Date: Tue, 28 Mar 2023 00:57:57 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH net 4/7] net: dsa: mt7530: set both CPU port interfaces to
 PHY_INTERFACE_MODE_NA
Content-Language: en-US
To: Vladimir Oltean <olteanv@gmail.com>
References: <20230326140818.246575-1-arinc.unal@arinc9.com>
 <20230326140818.246575-5-arinc.unal@arinc9.com>
 <20230327191242.4qabzrn3vtx3l2a7@skbuf>
From: =?UTF-8?B?QXLEsW7DpyDDnE5BTA==?= <arinc.unal@arinc9.com>
In-Reply-To: <20230327191242.4qabzrn3vtx3l2a7@skbuf>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230327_145852_490637_0A36203D 
X-CRM114-Status: GOOD (  27.03  )
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>,
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>,
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Cc: Andrew Lunn <andrew@lunn.ch>, Ilya Lipnitskiy <ilya.lipnitskiy@gmail.com>, =?UTF-8?Q?Ren=c3=a9_van_Dorst?= <opensource@vdorst.com>, Eric Dumazet <edumazet@google.com>, erkin.bozoglu@xeront.com, Florian Fainelli <f.fainelli@gmail.com>, Russell King <linux@armlinux.org.uk>, Richard van Schagen <richard@routerhints.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Landen Chao <Landen.Chao@mediatek.com>, Richard van Schagen <vschagen@cs.com>, Sean Wang <sean.wang@mediatek.com>, DENG Qingfang <dqfext@gmail.com>, Russell King <rmk+kernel@armlinux.org.uk>, linux-mediatek@lists.infradead.org, Matthias Brugger <matthias.bgg@gmail.com>, linux-arm-kernel@lists.infradead.org, AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, "David S. Miller" <davem@davemloft.net>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On 27.03.2023 22:12, Vladimir Oltean wrote:
> On Sun, Mar 26, 2023 at 05:08:15PM +0300, arinc9.unal@gmail.com wrote:
>> From: Arınç ÜNAL <arinc.unal@arinc9.com>
>>
>> Set interfaces of both CPU ports to PHY_INTERFACE_MODE_NA. Either phylink
>> or mt7530_setup_port5() on mt7530_setup() will handle the rest.
>>
>> This is already being done for port 6, do it for port 5 as well.
>>
>> Fixes: 38f790a80560 ("net: dsa: mt7530: Add support for port 5")
> 
> This is getting comical.. I think I'm putting too much energy in
> trying to understand the hidden meaning of this patch set.
> 
> In include/linux/phy.h we have:
> 
> typedef enum {
> 	PHY_INTERFACE_MODE_NA,
> 
> In lack of other initializer, the first element of an enum gets the
> value 0 in C.
> 
> Then, "priv" is allocated by this driver with devm_kzalloc(), which
> means that its entire memory is zero-filled. So priv->p5_interface and
> priv->p6_interface are already set to 0, or PHY_INTERFACE_MODE_NA.
> 
> There is no code path between the devm_kzalloc() and the position in
> mt7530_setup() that would change the value of priv->p5_interface or
> priv->p6_interface from their value of 0 (PHY_INTERFACE_MODE_NA).
> For example, mt753x_phylink_mac_config() can only be called from
> phylink, after dsa_port_phylink_create() was called. But
> dsa_port_phylink_create() comes later than ds->ops->setup() - one comes
> from dsa_tree_setup_ports(), and the other from dsa_tree_setup_switches().
> 
> The movement of the priv->p6_interface assignment with a few lines
> earlier does not change anything relative to the other call sites which
> assign different values to priv->p6_interface, so there isn't any
> functional change there, either.
> 
> So this patch is putting 0 into a variable containing 0, and claiming,
> through the presence of the Fixes: tag and the submission to the "net"
> tree, that it is a bug fix which should be backported to "stable".
> 
> Can it be that you are abusing the meaning of a "bug fix", and that I'm
> trying too hard to take this patch set seriously?

I don't appreciate your consistent use of the word "abuse" on my 
patches. I'm by no means a senior C programmer. I'm doing my best to 
correct the driver.

Thank you for explaining the process of phylink with DSA, I will adjust 
my patches accordingly.

I suggest you don't take my patches seriously for a while, until I know 
better.

Arınç

