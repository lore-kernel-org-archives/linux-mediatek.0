Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE61EC7EE2F
	for <linux-mediatek@archiver.kernel.org>; Tue,  6 Jun 2023 14:00:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FwrMrJM0MbRtGcxqqd7/qoRa+Z48fgcXIKuxfVUvplM=; b=zBC0SpwOfktJe7oOulMVsUiUaR
	EA2bh07DMkML5F2wuuyfmbCYFlcjTeQIEwr5XrVAGcz87+jkGaWCHw3kZ61g4uxRv5fsajKxNLZfQ
	Pa5QBHpQB29bgvNHAF6wQgkVq2Mb5RNYPAY1S+onSKTcMdkwjZRek+qJR08rw89NjNKR25jbXcWV2
	WRDncbXIuQimuQvJWbh/Hj00GdymoZkTR8f/JUenb9xgNnJLgHMT3jhcAS/XOd3cR7s+z9ucWkk+d
	S5C15Wru0rG6xpPEl56eKlrKAd19pKiH8Mz25HaIpVt/HENa954+ozSJxql4a3fmzsDQI3OeZI8uC
	Q5S1ZCYw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q6XEK-001vxd-0y;
	Tue, 06 Jun 2023 14:00:12 +0000
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q6XEI-001vvT-0c
	for linux-mediatek@lists.infradead.org;
	Tue, 06 Jun 2023 14:00:11 +0000
Received: by mail-wr1-x42f.google.com with SMTP id ffacd0b85a97d-30c4775d05bso4565650f8f.2
        for <linux-mediatek@lists.infradead.org>; Tue, 06 Jun 2023 07:00:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20221208.gappssmtp.com; s=20221208; t=1686060005; x=1688652005;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=FwrMrJM0MbRtGcxqqd7/qoRa+Z48fgcXIKuxfVUvplM=;
        b=Qmkebezhd3bE3EvClEVx5a7mjquFqdwFKJ07a+K/AxFUAUuZLUzo+nJmpQh0A1yT2c
         Kseq4TT0aRD3LwDElehU16MKuowQDxTagXLfA+S2b9hCQkgoCb+B6EXJJDuZ0N5zENVv
         aQXBjdLHxHKnWazjp2gv4X85tqhJ8MXmp8xYbReBJ6riWDDaUmpesbk5nH+H+j9BLFr+
         QBZZfqfPTE/DJ+03sI6+cvdy0DPOJdkAiRf7xQfCvC0d7D9j5RW6ozVBibrWo1Toonq7
         jLK6vvN7LyMlsKZ7ADisxhcWO+C+lAzJonHXyuQXiB9TmJMl36QVEdRf39rfR+RLWvfZ
         /l2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686060005; x=1688652005;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=FwrMrJM0MbRtGcxqqd7/qoRa+Z48fgcXIKuxfVUvplM=;
        b=GGnwPoaysCQHWyabux6UugfWARUD8DKDff6CcBLzaF+mV4lUOTxn4OD+CfoxGihViY
         kl4J+SYkiap32jPEFVUoXgTEDlGgaQUnjpCaXUK/tTtakPDt9CmJy9uzCVVlu0wUm5Nl
         ynU25O0BmWnMaAkWuvIvRPnhAp+LgGkNHg7LofJ62hucxyf2HTd6bMXLTkjqRQT7xWhL
         X9j6hLxI8KIdzXXUkaGCl/m/8sR8WMGhiEL+JP4XDd5BwfgQrsnD2dvAfTR7vIQA3DJt
         2f6ac9u0MEo0YFrzxorPYFD6XWLzvPBV/Zt/EQ10f4FRxs67KvjXQSBEBJL7hrRzGfXT
         zXxw==
X-Gm-Message-State: AC+VfDwZwD++FQeSa/Qbd+/7fvc2owT4H2y4DvJKakI7pOq10er7C4cQ
	218wALqoakodWE/C1ZfsZJ1WtA==
X-Google-Smtp-Source: ACHHUZ4ccc0T1eCTcxB1MhwmrQqdwiijiuxyeqJgwleyD1UPH+KZBBX2FUY5GnJZiKflEDdNGeHzAA==
X-Received: by 2002:a5d:5102:0:b0:30e:4c8d:c6c with SMTP id s2-20020a5d5102000000b0030e4c8d0c6cmr1743312wrt.55.1686060004870;
        Tue, 06 Jun 2023 07:00:04 -0700 (PDT)
Received: from [192.168.1.172] (158.22.5.93.rev.sfr.net. [93.5.22.158])
        by smtp.gmail.com with ESMTPSA id y14-20020a5d470e000000b002fed865c55esm12639517wrq.56.2023.06.06.07.00.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 06 Jun 2023 07:00:04 -0700 (PDT)
Message-ID: <1dd3ee51-f1e8-2a4e-f0d5-dd61ee5206f2@baylibre.com>
Date: Tue, 6 Jun 2023 16:00:03 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH v12 3/7] iommu/mediatek: Adjust mtk_iommu_config flow
Content-Language: en-US
To: Yong Wu <yong.wu@mediatek.com>, Joerg Roedel <joro@8bytes.org>,
 Will Deacon <will@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>
Cc: Robin Murphy <robin.murphy@arm.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 iommu@lists.linux.dev, linux-mediatek@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, mingyuan.ma@mediatek.com,
 yf.wang@mediatek.com, jianjiao.zeng@mediatek.com, chengci.xu@mediatek.com
References: <20230602090227.7264-1-yong.wu@mediatek.com>
 <20230602090227.7264-4-yong.wu@mediatek.com>
From: Alexandre Mergnat <amergnat@baylibre.com>
In-Reply-To: <20230602090227.7264-4-yong.wu@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230606_070010_227582_0E462DF1 
X-CRM114-Status: GOOD (  11.26  )
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

On 02/06/2023 11:02, Yong Wu wrote:
> If there are many ports in a infra master, current flow will update
> the INFRA register many times. This patch saves all ports to portid_msk
> in the front of mtk_iommu_config(), then update only once for the IOMMU
> configure. After this, we could avoid send too many SMC calls to ATF in
> MT8188.
> 
> Prepare for MT8188, also reduce the indention without functional change.

Reviewed-by: Alexandre Mergnat <amergnat@baylibre.com>

-- 
Regards,
Alexandre


