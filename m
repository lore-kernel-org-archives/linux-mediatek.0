From: Mars Cheng <mars.cheng@mediatek.com>
Subject: Re: [PATCH 2/2] ARM: dts: mediatek: add mt6580 basic support
Date: Wed, 24 Jun 2015 19:59:13 +0800
Message-ID: <1435147153.3792.9.camel@mtkswgap22>
References: <1433319533-24803-1-git-send-email-mars.cheng@mediatek.com>
	 <1433319533-24803-3-git-send-email-mars.cheng@mediatek.com>
	 <3799922.TWv12CPu81@ubix>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <3799922.TWv12CPu81@ubix>
Sender: linux-kernel-owner@vger.kernel.org
To: Matthias Brugger <matthias.bgg@gmail.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org, Yingjoe Chen <yingjoe.chen@mediatek.com>, CC Hwang <cc.hwang@mediatek.com>, Jades Shih <jades.shih@mediatek.com>, Loda Chou <loda.chou@mediatek.com>, Miles Chen <miles.chen@mediatek.com>, MY Chuang <my.chuang@mediatek.com>, Scott Shu <scott.shu@mediatek.com>
List-Id: linux-mediatek@lists.infradead.org

On Tue, 2015-06-23 at 21:45 +0200, Matthias Brugger wrote:
> > +	soc {
> 
> Please drop the soc node as well and just add the components directly.
> 
> Thanks,
> Matthias
May I know the reason to remove the soc node? I follow other xxxx.dtsi
to add this node.

Thanks.
