From: Matthias Brugger <matthias.bgg@gmail.com>
Subject: Re: [PATCH 2/2] ARM: dts: mediatek: add mt6580 basic support
Date: Wed, 24 Jun 2015 22:25:56 +0200
Message-ID: <2753320.5M4yQIm8Im@ubix>
References: <1433319533-24803-1-git-send-email-mars.cheng@mediatek.com> <3799922.TWv12CPu81@ubix> <1435147153.3792.9.camel@mtkswgap22>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1435147153.3792.9.camel@mtkswgap22>
Sender: linux-kernel-owner@vger.kernel.org
To: Mars Cheng <mars.cheng@mediatek.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org, Yingjoe Chen <yingjoe.chen@mediatek.com>, CC Hwang <cc.hwang@mediatek.com>, Jades Shih <jades.shih@mediatek.com>, Loda Chou <loda.chou@mediatek.com>, Miles Chen <miles.chen@mediatek.com>, MY Chuang <my.chuang@mediatek.com>, Scott Shu <scott.shu@mediatek.com>
List-Id: linux-mediatek@lists.infradead.org

On Wednesday, June 24, 2015 07:59:13 PM Mars Cheng wrote:
> On Tue, 2015-06-23 at 21:45 +0200, Matthias Brugger wrote:
> > > +	soc {
> > 
> > Please drop the soc node as well and just add the components directly.
> > 
> > Thanks,
> > Matthias
> 
> May I know the reason to remove the soc node? I follow other xxxx.dtsi
> to add this node.

The device tree is reflecting the hardware, if you add a soc node like this, it 
is seen like a bus, but there is not really a bus.

I think point of view about this has change over time and nowadays it is 
preferred not to add a soc node.

Regards,
Matthias
