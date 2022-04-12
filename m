Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 76D48C433F5
	for <linux-mediatek@archiver.kernel.org>; Tue, 12 Apr 2022 09:04:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:
	MIME-Version:In-Reply-To:References:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=jXM0iqCbhMjbYdB8fS66VNp1bOjXS+8HAzT9cAsLvIg=; b=lCnBRES81thXxLEJPyJhTdUXgf
	fTbkZEFdm7GixnbPqOMI0C6yilu0zVoWVq8Qt8iTqPyGxw2v7z24Dsh2GgCZVyoaj/aBS9g1N8Q+R
	4y1KXvecvyDEHr9G8lZTfjUzrbPpx+OWPlbGXpHQkPNXt7+K6cfpQAPWJm0NoHokGVvxNJ5wTlSBx
	6FfTnM8v2Q6F/yWM7u20uCTK3PXT0gm805uQIWU2YKw5ZxY4UQ0Sd/tSy2HMGWxJqlm3F6C15J/0N
	Y6wd5psuROxHOjyEscpVpj1jCpe9+TOtPXDmI8vqkXIdzqaXkzjjmNUdC8cDaCU9ClWpAJgYpTAKN
	PPPYwPoQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1neCRU-00ClwS-MA; Tue, 12 Apr 2022 09:04:08 +0000
Received: from mail-oi1-x22e.google.com ([2607:f8b0:4864:20::22e])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1neCRR-00CluY-Aa
 for linux-mediatek@lists.infradead.org; Tue, 12 Apr 2022 09:04:07 +0000
Received: by mail-oi1-x22e.google.com with SMTP id k10so18434410oia.0
 for <linux-mediatek@lists.infradead.org>; Tue, 12 Apr 2022 02:04:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20210112.gappssmtp.com; s=20210112;
 h=from:user-agent:references:in-reply-to:mime-version:date:message-id
 :subject:to:cc;
 bh=TaVLZyoZEENt9mm6XHe8rhxlLaPeM8tk8R1AgC2794g=;
 b=sesqj42IAFm9WSWsTOqHdYA5Rorjo3bfN3YoTtq6JHYKWQqX1WmBP4uULeeni1uzGm
 /hfuD40g58GgUJw3f9vzeM8X+LkiE2vXLWO6yolkj181V2nTWeGDiebzZ91tyH5BpGPv
 zoQIBLJLMpiNHlQdyQc9zrY059t+bgc1gIWC7WwGslbm7t2nXtJJ5k723Eh4DT8Tb0QL
 GFGKkRRWR16wjNsMJ07818rU6oJfnetWzWgQauQeYKQj0z3lhi3ue8MXM9rZPV19+9rQ
 zqEOHIBojyGpj0ozyivfpOgZ5YZi4XuapP//Puf3rnOnvV42BlenzwpudpXnFaFyKAcx
 bC8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:user-agent:references:in-reply-to
 :mime-version:date:message-id:subject:to:cc;
 bh=TaVLZyoZEENt9mm6XHe8rhxlLaPeM8tk8R1AgC2794g=;
 b=qWy0su6J5L3ijUz8K7kn/Rd10hK5mrJ16XUMxbKZCSIj/0AusaFNp44ZjEyzMJetBb
 bpp0IyjUcoKfg7DECSnlos7c9J5/wxdbDdw62Sw+J2WA8tVzPzhMd0nuLOOWqSNoCDW5
 QAuTsUCdNhKaJbL9WDFn0Fll0P5DiOIlwlNZM4Euh8NLaeso9V4k7FC+vhlij+zR0FXu
 WaL7nvAvkZ+C99/uyMvxdqUC2KWO83pK45m1wG3xSPUStEgpBU+PJv12GNys4hQakDW2
 BHHh/pSUnkqtoqtN9hjaZioFZp29t75Z9hDjRbWokY+gli78ONLkHUinfXSrmqz2Iwpw
 anhQ==
X-Gm-Message-State: AOAM532FjbSA4YAYQ1/+3hnsNZzg+alpA3XfpzIV4jxqwTEQhuplEnDU
 DoAvnzLusE6Tlr9la5xOd/u2FJ164UfhiOY4mX7UEw==
X-Google-Smtp-Source: ABdhPJzzWwf0u6lyl2/9u7EvJbdiNju6WRex6OFE3yBhD7hT45+S39d1b5mmEOgGvzLwyVK+y4+UdItaHwgA6/SFgm8=
X-Received: by 2002:a05:6808:159d:b0:2da:3946:ab3d with SMTP id
 t29-20020a056808159d00b002da3946ab3dmr1265654oiw.248.1649754242818; Tue, 12
 Apr 2022 02:04:02 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 12 Apr 2022 02:04:02 -0700
From: Guillaume Ranquet <granquet@baylibre.com>
User-Agent: meli 0.7.2
References: <20220327223927.20848-1-granquet@baylibre.com>
 <20220327223927.20848-18-granquet@baylibre.com>
 <4697e3af-86f7-83e0-1737-3f5000fc8d30@collabora.com>
In-Reply-To: <4697e3af-86f7-83e0-1737-3f5000fc8d30@collabora.com>
MIME-Version: 1.0
Date: Tue, 12 Apr 2022 02:04:02 -0700
Message-ID: <CABnWg9s7MN_21CEYVJV9=udfYkYQ_huJjQvLf+Jcb3Dmc8pNCA@mail.gmail.com>
Subject: Re: [PATCH v9 17/22] phy: phy-mtk-dp: Add driver for DP phy
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 vkoul@kernel.org, 
 airlied@linux.ie, chunfeng.yun@mediatek.com, chunkuang.hu@kernel.org, 
 ck.hu@mediatek.com, daniel@ffwll.ch, deller@gmx.de, jitao.shi@mediatek.com, 
 kishon@ti.com, krzk+dt@kernel.org, maarten.lankhorst@linux.intel.com, 
 matthias.bgg@gmail.com, mripard@kernel.org, p.zabel@pengutronix.de, 
 robh+dt@kernel.org, tzimmermann@suse.de
Cc: devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 linux-arm-kernel@lists.infradead.org, linux-fbdev@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org, 
 linux-phy@lists.infradead.org, markyacoub@google.com, 
 Markus Schneider-Pargmann <msp@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220412_020405_389455_2BA514A0 
X-CRM114-Status: GOOD (  21.85  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Mon, 28 Mar 2022 10:20, AngeloGioacchino Del Regno
<angelogioacchino.delregno@collabora.com> wrote:
>Il 28/03/22 00:39, Guillaume Ranquet ha scritto:
>> From: Markus Schneider-Pargmann <msp@baylibre.com>
>>
>> This is a new driver that supports the integrated DisplayPort phy for
>> mediatek SoCs, especially the mt8195. The phy is integrated into the
>> DisplayPort controller and will be created by the mtk-dp driver. This
>> driver expects a struct regmap to be able to work on the same registers
>> as the DisplayPort controller. It sets the device data to be the struct
>> phy so that the DisplayPort controller can easily work with it.
>>
>> The driver does not have any devicetree bindings because the datasheet
>> does not list the controller and the phy as distinct units.
>>
>> The interaction with the controller can be covered by the configure
>> callback of the phy framework and its displayport parameters.
>>
>> Signed-off-by: Markus Schneider-Pargmann <msp@baylibre.com>
>> Signed-off-by: Guillaume Ranquet <granquet@baylibre.com>
>> ---
>>   MAINTAINERS                       |   1 +
>>   drivers/phy/mediatek/Kconfig      |   8 ++
>>   drivers/phy/mediatek/Makefile     |   1 +
>>   drivers/phy/mediatek/phy-mtk-dp.c | 201 ++++++++++++++++++++++++++++++
>>   4 files changed, 211 insertions(+)
>>   create mode 100644 drivers/phy/mediatek/phy-mtk-dp.c
>>
>
>..snip..
>
>> diff --git a/drivers/phy/mediatek/phy-mtk-dp.c b/drivers/phy/mediatek/phy-mtk-dp.c
>> new file mode 100644
>> index 000000000000..e5c5494f3636
>> --- /dev/null
>> +++ b/drivers/phy/mediatek/phy-mtk-dp.c
>
>..snip..
>
>> +
>> +static int mtk_dp_phy_probe(struct platform_device *pdev)
>> +{
>> +	struct device *dev = &pdev->dev;
>> +	struct mtk_dp_phy *dp_phy;
>> +	struct phy *phy;
>> +	struct regmap *regs;
>> +
>> +	regs = syscon_regmap_lookup_by_phandle(dev->of_node, "mediatek,dp-syscon");
>> +
>
>Please drop this blank line
>
>> +	if (IS_ERR(regs))
>> +		return PTR_ERR(regs);
>> +
>> +	dp_phy = devm_kzalloc(dev, sizeof(*dp_phy), GFP_KERNEL);
>> +	if (!dp_phy)
>> +		return -ENOMEM;
>> +
>> +	dp_phy->regs = regs;
>> +
>> +	phy = devm_phy_create(dev, NULL, &mtk_dp_phy_dev_ops);
>> +
>
>Same here
>
>> +	if (IS_ERR(phy))
>> +		return dev_err_probe(dev, PTR_ERR(phy), "Failed to create DP PHY: %ld\n", PTR_ERR(phy));
>> +
>
>Using dev_err_probe automates printing the error, so the correct usage is:
>
>return dev_err_probe(dev, PTR_ERR(phy), "Failed to create DP PHY\n");
>
>> +	phy_set_drvdata(phy, dp_phy);
>> +
>> +	return 0;
>> +}
>> +
>> +struct platform_driver mtk_dp_phy_driver = {
>> +	.probe = mtk_dp_phy_probe,
>> +	.driver = {
>> +		.name = "mediatek-dp-phy",
>> +	},
>> +};
>> +module_platform_driver(mtk_dp_phy_driver);
>
>Also, in your dt-binding, you mention a compatible for this driver, but I don't see
>any, here. This means that you do know what to do, so please do it.
>

Following the comments from rob [1], I'll revert back to using
platform_device_register_data() from v8.

[1] https://lore.kernel.org/linux-mediatek/YkOPB5W7uXkOc72%2F@robh.at.kernel.org/

>Regards,
>Angelo
>
>> +
>> +MODULE_AUTHOR("Markus Schneider-Pargmann <msp@baylibre.com>");
>> +MODULE_DESCRIPTION("MediaTek DP PHY Driver");
>> +MODULE_LICENSE("GPL");
>

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
