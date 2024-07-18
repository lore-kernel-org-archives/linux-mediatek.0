Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 58665C3DA61
	for <linux-mediatek@archiver.kernel.org>; Thu, 18 Jul 2024 22:08:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Oadz38JoIr7T8qEdl1qZy6h/lKoGcM2cLSz3E3Ktv6E=; b=eJPfKqk0FZaG0+dP/E2g9obunf
	Lmco/ZijHIafwk+Uzp4A0u/znCVl8TGwXfh/lab/NolZYptvHiaPilONyu5uxNEn/Bn3V9/tO9eaC
	XAa8BGFU7C7Pzz1BnXsfhdwTBPsciBzktlEwzAfeiiUMNBYUlhrdYplVEj64U/ofKcK2esiJK0yqk
	XSmdLkXYsxiQ2HGfpqWa0X70NHC88B74X/99XPvvIwsGLa/lY01nASl4FcTjuqyOkc1qc8JegyamK
	b2aHIJEHmV12nfVqzH4C4xI7gMcDy/L9B0aplSb+WMv3zVCHwFD9CrUSrdcc2zXAEUGmRrLpm6Vgd
	QshLQ4IA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sUZII-00000000opL-3nbL;
	Thu, 18 Jul 2024 22:08:10 +0000
Received: from madrid.collaboradmins.com ([2a00:1098:ed:100::25])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sUZHv-00000000okz-20MN;
	Thu, 18 Jul 2024 22:07:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1721340462;
	bh=gzGiI2wvuZEYnzUMFQ5wGfxZiwKRMQdKAglWmCVvamQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=eGD9EUXebDntpI1lVGMqIM9QrrH1deaoVIzxKhENmh3W17tvtAp1fnPoZZb0wr7Jl
	 7YDULidHqHeCU81e9AeYM5KVRmH7I57A+lUTHzegyr9GxRtMtkVGYBuGzXUJQ4rnhk
	 mWfXIo1erYGSpQ5quJzjentVLKjx4JMq12TJr7JzN0thSKkKbdgt/WEtV8MMDdnyXq
	 ird2tawtKmt2g3Ln2LOA9TUW1AXBEiaXxaXxGolYjC6Gvf0LlTk3hlgGW2oG0v7OD0
	 ftz4bilWCdLC0EMfX4fd0dTfqazOT0++DZDBPDE3P11sfoSv+AUsCJVf+RcPL6gG9k
	 Ab8CCBZTWz9iQ==
Received: from notapiano (zone.collabora.co.uk [167.235.23.81])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: nfraprado)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id 6BA5B3780520;
	Thu, 18 Jul 2024 22:07:40 +0000 (UTC)
Date: Thu, 18 Jul 2024 18:07:38 -0400
From: =?utf-8?B?TsOtY29sYXMgRi4gUi4gQS4=?= Prado <nfraprado@collabora.com>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Chen-Yu Tsai <wenst@chromium.org>, kernel@collabora.com,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH v2] nvmem: mtk-efuse: Only register socinfo device if
 needed cells are there
Message-ID: <05dd24ec-d084-4708-a241-b4714391118a@notapiano>
References: <20240708-mtk-socinfo-no-data-probe-err-v2-1-7ae252acbcc2@collabora.com>
 <a1914f2b-93f2-4de4-9c4b-2e1f6b39cf3a@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <a1914f2b-93f2-4de4-9c4b-2e1f6b39cf3a@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240718_150747_700984_BE300415 
X-CRM114-Status: GOOD (  25.66  )
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

On Wed, Jul 10, 2024 at 11:31:11AM +0200, AngeloGioacchino Del Regno wrote:
> Il 08/07/24 21:43, Nícolas F. R. A. Prado ha scritto:
> > Not every efuse region has cells storing SoC information. Only register
> > an socinfo device if the required cells are present.
> > 
> > This prevents the pointless process of creating an socinfo device,
> > probing it with the socinfo driver only to ultimately error out like so
> > 
> >    mtk-socinfo mtk-socinfo.0.auto: error -ENOENT: Failed to get socinfo data
> >    mtk-socinfo mtk-socinfo.0.auto: probe with driver mtk-socinfo failed with error -2
> > 
> > This issue is observed on the mt8183-kukui-jacuzzi-juniper-sku16
> > platform, which has two efuse regions, but only one of them contains the
> > SoC data.
> > 
> 
> I think that we should rather remove or disable the first eFuse region, as
> even though that is enabled:
> 
>  - This is the only SoC having two regions
>    - I'm not even sure that the region at 0x8000000 is really efuse
>    - Not even referenced in datasheets....
>  - It's unused, as in, it's not exposing any information and no declared cells
> 
> Don't misunderstand me, this is not an invalid change, but I rather prefer
> to resolve this by disabling that (effectively unused!) node, avoiding to
> add more lines to this driver that would be useless after fixing that small
> single thing.

I'm not confident that we can say that that efuse is not exposing any
information. Indeed there are no cells so it's not used by any other driver, but
the efuse contents are still exposed to userspace if CONFIG_NVMEM_SYSFS is
enabled.

I dumped it on one of the mt8183-kukui-jacuzzi-juniper-sku16 units:

  $ ls -l /sys/bus/nvmem/devices/
  total 0
  lrwxrwxrwx    1 root     root             0 Jul 18 21:43 mmtd0 -> ../../../devices/platform/soc/11010000.spi/spi_master/spi1/spi1.0/mtd/mtd0/mtd0
  lrwxrwxrwx    1 root     root             0 Jul 18 21:43 nvmem0 -> ../../../devices/platform/soc/8000000.efuse/nvmem0
  lrwxrwxrwx    1 root     root             0 Jul 18 21:43 nvmem1 -> ../../../devices/platform/soc/11f10000.efuse/nvmem1
  
  $ hexdump -C /sys/bus/nvmem/devices/nvmem0/nvmem
  00000000  88 07 00 00 00 8a 00 00  00 ca 00 00 00 00 00 00  |................|
  00000010

I power cycled the unit and ran this again and it still showed the same
contents. I also ran the same on a different unit of the same model and it
showed the same contents. Of course this doesn't prove anything, but given that
the contents seem to be constant across reboots and even different units, it
does look like it could be an efuse to me. :)

As to whether the contents are useful at all, or if there are
userspace applications making use of it I have no clue. But if in doubt,
shouldn't we keep it around?

Thanks,
Nícolas

