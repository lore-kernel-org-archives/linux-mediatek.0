Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2D093C25B76
	for <linux-mediatek@archiver.kernel.org>; Mon,  3 Jun 2024 17:25:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:To:References:Message-Id:
	Content-Transfer-Encoding:Cc:Date:In-Reply-To:From:Subject:Mime-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4DfOU8aQl0aDoujS+l1W8I9cPbB9Sd5aNNyJFDGp/QQ=; b=1F6LBL2+rjCGXkQshJneUs+8WU
	QzUaZZvAkQbGNAHKoIm2JLEe6Wxi9nFp07VnDSvThX1vdhEKoqZLhwV3otxaxKp+lkkr50wMiGsNf
	dlmNGIYiIxkwnzVL0idsYzfULHGWHOskDOOsXApFbo1gLou8E75IYv+8f0HIm5gIdKt51aLNSN6AJ
	VliNcLJT3iGAWKfrm1nzJ1NvNXPFh02ZbDzKhT4REaKU9q/mmfTRXu0p3f3VZLwpFdt3Z7uEDLnkx
	cW/BTpXIOWt5tTqlTRtHD0MNuiPeVkcJpXUQZi9gsIkLxeYPIk3mvqz/9dzMfkNl05boDgAg0F51N
	plp/rBwg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sEBQx-0000000HV0y-1bHa;
	Mon, 03 Jun 2024 17:25:23 +0000
Received: from linux.microsoft.com ([13.77.154.182])
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sEBQs-0000000HUyd-0mYR;
	Mon, 03 Jun 2024 17:25:19 +0000
Received: from smtpclient.apple (d66-183-91-182.bchsia.telus.net [66.183.91.182])
	by linux.microsoft.com (Postfix) with ESMTPSA id 4684920681D5;
	Mon,  3 Jun 2024 10:25:13 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com 4684920681D5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
	s=default; t=1717435514;
	bh=4DfOU8aQl0aDoujS+l1W8I9cPbB9Sd5aNNyJFDGp/QQ=;
	h=Subject:From:In-Reply-To:Date:Cc:References:To:From;
	b=arwB9k2cp5qmOpH04JZQJkpaQ68dKr6NHq6/nWjIeKTEglSLJZbHneTkxRo0iYye3
	 dopPLk66Mp6Cqqtct/3LWOtVyWSXCVY5VMtnmDbdTLbXrzM1H6t1A8KCeQ5Sp+gzGS
	 Acr7rY4qAUIDkO+vSD/92kHIH7AgZovgYBJ1BnFc=
Content-Type: text/plain;
	charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3774.600.62\))
Subject: Re: [PATCH 9/9] mmc: Convert from tasklet to BH workqueue
From: Allen Pais <apais@linux.microsoft.com>
In-Reply-To: <7e618af0-51a7-4941-a386-0ac68c66d358@microchip.com>
Date: Mon, 3 Jun 2024 10:25:02 -0700
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Tejun Heo <tj@kernel.org>,
 Kees Cook <keescook@chromium.org>,
 Vinod Koul <vkoul@kernel.org>,
 marcan@marcan.st,
 sven@svenpeter.dev,
 florian.fainelli@broadcom.com,
 Ray Jui <rjui@broadcom.com>,
 Scott Branden <sbranden@broadcom.com>,
 Paul Cercueil <paul@crapouillou.net>,
 Eugeniy.Paltsev@synopsys.com,
 manivannan.sadhasivam@linaro.org,
 Viresh Kumar <vireshk@kernel.org>,
 Frank.Li@nxp.com,
 Leo Li <leoyang.li@nxp.com>,
 zw@zh-kernel.org,
 Zhou Wang <wangzhou1@hisilicon.com>,
 haijie1@huawei.com,
 Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Sean Wang <sean.wang@mediatek.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 angelogioacchino.delregno@collabora.com,
 =?utf-8?Q?Andreas_F=C3=A4rber?= <afaerber@suse.de>,
 Logan Gunthorpe <logang@deltatee.com>,
 Daniel Mack <daniel@zonque.org>,
 Haojian Zhuang <haojian.zhuang@gmail.com>,
 Robert Jarzmik <robert.jarzmik@free.fr>,
 andersson@kernel.org,
 konrad.dybcio@linaro.org,
 Orson Zhai <orsonzhai@gmail.com>,
 baolin.wang@linux.alibaba.com,
 Lyra Zhang <zhang.lyra@gmail.com>,
 Patrice CHOTARD <patrice.chotard@foss.st.com>,
 Linus Walleij <linus.walleij@linaro.org>,
 Chen-Yu Tsai <wens@csie.org>,
 =?utf-8?Q?Jernej_=C5=A0krabec?= <jernej.skrabec@gmail.com>,
 peter.ujfalusi@gmail.com,
 kys@microsoft.com,
 haiyangz@microsoft.com,
 wei.liu@kernel.org,
 decui@microsoft.com,
 jassisinghbrar@gmail.com,
 mchehab@kernel.org,
 maintainers@bluecherrydvr.com,
 ulf.hansson@linaro.org,
 manuel.lauss@gmail.com,
 mirq-linux@rere.qmqm.pl,
 jh80.chung@samsung.com,
 oakad@yahoo.com,
 hayashi.kunihiko@socionext.com,
 mhiramat@kernel.org,
 brucechang@via.com.tw,
 HaraldWelte@viatech.com,
 pierre@ossman.eu,
 duncan.sands@free.fr,
 stern@rowland.harvard.edu,
 oneukum@suse.com,
 openipmi-developer@lists.sourceforge.net,
 dmaengine@vger.kernel.org,
 asahi@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org,
 linux-rpi-kernel@lists.infradead.org,
 linux-mips@vger.kernel.org,
 imx@lists.linux.dev,
 linuxppc-dev@lists.ozlabs.org,
 linux-mediatek@lists.infradead.org,
 linux-actions@lists.infradead.org,
 linux-arm-msm@vger.kernel.org,
 linux-riscv@lists.infradead.org,
 linux-sunxi@lists.linux.dev,
 linux-tegra@vger.kernel.org,
 linux-hyperv@vger.kernel.org,
 linux-rdma@vger.kernel.org,
 linux-media@vger.kernel.org,
 linux-mmc@vger.kernel.org,
 linux-omap@vger.kernel.org,
 linux-renesas-soc@vger.kernel.org,
 linux-s390@vger.kernel.org,
 netdev@vger.kernel.org,
 linux-usb@vger.kernel.org
Content-Transfer-Encoding: quoted-printable
Message-Id: <61F36002-C765-410C-8EF9-203593C269FF@linux.microsoft.com>
References: <20240327160314.9982-1-apais@linux.microsoft.com>
 <20240327160314.9982-10-apais@linux.microsoft.com>
 <7e618af0-51a7-4941-a386-0ac68c66d358@microchip.com>
To: Aubin Constans <aubin.constans@microchip.com>
X-Mailer: Apple Mail (2.3774.600.62)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240603_102518_422582_F7353A57 
X-CRM114-Status: GOOD (  13.80  )
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
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org



> On Jun 3, 2024, at 5:38=E2=80=AFAM, Aubin Constans =
<aubin.constans@microchip.com> wrote:
>=20
> On 27/03/2024 17:03, Allen Pais wrote:
>> EXTERNAL EMAIL: Do not click links or open attachments unless you =
know the content is safe
>> The only generic interface to execute asynchronously in the BH =
context is
>> tasklet; however, it's marked deprecated and has some design flaws. =
To
>> replace tasklets, BH workqueue support was recently added. A BH =
workqueue
>> behaves similarly to regular workqueues except that the queued work =
items
>> are executed in the BH context.
>> This patch converts drivers/infiniband/* from tasklet to BH =
workqueue.
>> Based on the work done by Tejun Heo <tj@kernel.org>
>> Branch: https://git.kernel.org/pub/scm/linux/kernel/git/tj/wq.git =
for-6.10
>> Signed-off-by: Allen Pais <allen.lkml@gmail.com>
>> ---
>>  drivers/mmc/host/atmel-mci.c                  | 35 ++++-----
> [...]
>=20
> For atmel-mci, judging from a few simple tests, performance is =
preserved.
> E.g. writing to a SD Card on the SAMA5D3-Xplained board:
> time dd if=3D/dev/zero of=3D/opt/_del_me bs=3D4k count=3D64k
>=20
>     Base 6.9.0 : 0.07user 5.05system 0:18.92elapsed 27%CPU
>  Patched 6.9.0+: 0.12user 4.92system 0:18.76elapsed 26%CPU
>=20
> However, please resolve what checkpatch is complaining about:
> scripts/checkpatch.pl --strict =
PATCH-9-9-mmc-Convert-from-tasklet-to-BH-workqueue.mbox
>=20
>  WARNING: please, no space before tabs
>  #72: FILE: drivers/mmc/host/atmel-mci.c:367:
>  +^Istruct work_struct ^Iwork;$
>=20
> Same as discussions on the USB patch[1] and others in this series, I =
am also in favour of "workqueue" or similar in the comments, rather than =
just "work".

 Will send out a new version.

Thank you very much for testing and providing your review.

- Allen

>=20
> Apart from that:
> Tested-by: Aubin Constans <aubin.constans@microchip.com>
> Acked-by: Aubin Constans <aubin.constans@microchip.com>
>=20
> Thanks.
>=20
> [1]: =
https://lore.kernel.org/linux-mmc/CAOMdWSLipPfm3OZTpjZz4uF4M+E_8QAoTeMcKBX=
awLnkTQx6Jg@mail.gmail.com/


