Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BC0ABC3DA49
	for <linux-mediatek@archiver.kernel.org>; Wed, 24 Jul 2024 00:01:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HjPcF3TBfRjPpVjOMK7/fpnxgVcc8VtkPZ4xX3JlhSM=; b=TdWQTPNIxQpGMAtOnm5QIjDF9n
	bogQCCFrKMgTpIK1vfQC9tbwx14tPCTnFt2H/pH/n85vlmrAcHND4ql6gS7fKLySbsI1Uf8XvYSY+
	HgFjOCsQSLIaK5XIW/q+r981pFT4n0epgTC5dKW6SD3Kyk6XmvgIRiHu3PdDwPNP1/sJScKyx/rHo
	dOfwOs4Kd9eUz0TISOhj+hjBWOm+z9Khd4yJpznYuHdU1r6gSjOlrl/tPaPbyKIazwSk1Z2FtAUAs
	9Nc/wbjqGY7ChEBMkDrikzqjAS583nfSblItV0WNzMdqkkQhf0jkOI1rmrjarJpvMOFmQBPbYnk1v
	oO0v7ADg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sWPRm-0000000DqLs-2hwx;
	Wed, 24 Jul 2024 00:01:34 +0000
Received: from mail-qk1-x72e.google.com ([2607:f8b0:4864:20::72e])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sWPRN-0000000DqIl-0n13;
	Wed, 24 Jul 2024 00:01:10 +0000
Received: by mail-qk1-x72e.google.com with SMTP id af79cd13be357-79ef93865afso349244085a.1;
        Tue, 23 Jul 2024 17:01:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1721779267; x=1722384067; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=HjPcF3TBfRjPpVjOMK7/fpnxgVcc8VtkPZ4xX3JlhSM=;
        b=etVLtLgcRy0w4el0b6iZMBakylC2QBzRljMyTx6DVSrrjzPNqRkaw5AQPryjkEcl6h
         xUBigbraoM3bm8DILn+zcqVuN1GGMEuAjlwzmM60zAtD5XgXbiFVUwI+i97zAIJHJWjh
         m1k/7sNRV5JxDRKD2iCt0bhkuRORnhpqLMrAoiIChZGryOHk05ivRvpZBlsOEPjvgMHk
         jOH/kS8f0L2KWbrcC8Y8t3KhWmTch3VE+omg2jkohCsWSpfp8CUFAdeBWCerE3qWlQJi
         QkB9cyF4uRhniOBBJiwDdryRBp+RNgdQ4mElliioR2hFWfJO+wLiVXM377E0EfZUIbkg
         /Ang==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721779267; x=1722384067;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=HjPcF3TBfRjPpVjOMK7/fpnxgVcc8VtkPZ4xX3JlhSM=;
        b=f2g8xQ+Z5rO1B846j6GkUm+3UZ1BnZywUfBg9AaBEAVOYucFfeF/99AhReel6/wTYZ
         GiVU7sPInV+ipZlyeNrMKDiKe2sXOuPZtaKipTqXmFV1OxdgrXRv4wpMieBcdrNFCSfM
         hcThY9F2vaukNYCJeEb0kLoIkw/dNalYQEpkN1QRixQcnd3dT+U08usI3+x/1wKJ+r3m
         QbHLGZptRkdfQNwcWFhv/kuV2u/9+X5XB9bC2LJ+McjRcjZn1hyNxGNu9Ix9hpHcuX+H
         ELS9B2CNpyALGWBIri1AMonW7OBqzcjuzS175pPdoSLQt6hiNdeActtbf7u/yqSGUfQY
         5f+w==
X-Forwarded-Encrypted: i=1; AJvYcCU0dtdFxAwFmVUgyuduIoWyCjtziWhkoMxglm/JRTgN/mS4BwH7mLHxEbQ3Sxcv2K8q67fhZoYUSrpG8dWeivfzWHw9kJypFWffaAGIjs8b3pQfY8xiZolaUxBY0snzCazJfsYeIJsjUTAtWYRik4XEsfp9H57wMSj4QGA/OcsmQ3R7BLwg1bhIQ/ItkNqlGvj2dd0i4i8qdjwVgfgadA==
X-Gm-Message-State: AOJu0Yxeedkbp2BRpqePb1pCv82VsZWEfi3cnU5sFFkiUMkukcbln7JQ
	JJCGG84RCq89Beb+Ej/S8xBLsFSVG3fp0DPeiyoRlFKZPjIEti+1
X-Google-Smtp-Source: AGHT+IEmrijFPvlymDjiYvpgNdufWQdFfnX8iqTj46gVg2s6gl42hPf89eITjYUBUaoYa2+oQ9bIdw==
X-Received: by 2002:a05:620a:2544:b0:7a1:c427:22e0 with SMTP id af79cd13be357-7a1c427267amr363339485a.41.1721779267163;
        Tue, 23 Jul 2024 17:01:07 -0700 (PDT)
Received: from [10.67.48.245] ([192.19.223.252])
        by smtp.googlemail.com with ESMTPSA id af79cd13be357-7a198fae6d8sm523722485a.7.2024.07.23.17.00.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 23 Jul 2024 17:01:04 -0700 (PDT)
Message-ID: <62c24823-fa95-46bc-8c7d-0d15cbddc4f6@gmail.com>
Date: Tue, 23 Jul 2024 17:00:51 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 04/15] PCI: brcmstb: Silence set affinity failed
 warning
To: Marek Vasut <marek.vasut+renesas@mailbox.org>, linux-pci@vger.kernel.org
Cc: =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kw@linux.com>,
 =?UTF-8?Q?Pali_Roh=C3=A1r?= <pali@kernel.org>,
 =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
 Aleksandr Mishin <amishin@t-argos.ru>,
 Anna-Maria Behnsen <anna-maria@linutronix.de>,
 Anup Patel <apatel@ventanamicro.com>, Bjorn Helgaas <bhelgaas@google.com>,
 Broadcom internal kernel review list
 <bcm-kernel-feedback-list@broadcom.com>,
 Daire McNamara <daire.mcnamara@microchip.com>,
 Damien Le Moal <dlemoal@kernel.org>,
 Florian Fainelli <florian.fainelli@broadcom.com>,
 Hou Zhiqiang <Zhiqiang.Hou@nxp.com>, Jianjun Wang
 <jianjun.wang@mediatek.com>, Jim Quinlan <jim2101024@gmail.com>,
 Jingoo Han <jingoohan1@gmail.com>,
 Jisheng Zhang <Jisheng.Zhang@synaptics.com>,
 Jon Hunter <jonathanh@nvidia.com>,
 Jonathan Derrick <jonathan.derrick@linux.dev>,
 Joyce Ooi <joyce.ooi@intel.com>,
 Karthikeyan Mitran <m.karthikeyan@mobiveil.co.in>,
 Kishon Vijay Abraham I <kishon@kernel.org>, Koichiro Den
 <den@valinux.co.jp>, Lorenzo Pieralisi <lpieralisi@kernel.org>,
 Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
 Marc Zyngier <maz@kernel.org>, Michal Simek <michal.simek@amd.com>,
 Nicolas Saenz Julienne <nsaenz@kernel.org>, Niklas Cassel
 <cassel@kernel.org>, Nipun Gupta <nipun.gupta@amd.com>,
 Nirmal Patel <nirmal.patel@linux.intel.com>, Rob Herring <robh@kernel.org>,
 Ryder Lee <ryder.lee@mediatek.com>,
 Shivamurthy Shastri <shivamurthy.shastri@linutronix.de>,
 Siddharth Vadapalli <s-vadapalli@ti.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 Thomas Gleixner <tglx@linutronix.de>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-renesas-soc@vger.kernel.org, linux-rpi-kernel@lists.infradead.org,
 linux-tegra@vger.kernel.org
References: <20240723132958.41320-1-marek.vasut+renesas@mailbox.org>
 <20240723132958.41320-5-marek.vasut+renesas@mailbox.org>
Content-Language: en-US
From: Florian Fainelli <f.fainelli@gmail.com>
In-Reply-To: <20240723132958.41320-5-marek.vasut+renesas@mailbox.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240723_170109_283740_10BBB31D 
X-CRM114-Status: UNSURE (   7.44  )
X-CRM114-Notice: Please train this message.
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

On 7/23/24 06:27, Marek Vasut wrote:
> Use newly introduced MSI_FLAG_NO_AFFINITY, which keeps .irq_set_affinity unset
> and allows migrate_one_irq() code in cpuhotplug.c to exit right away, without
> printing "IRQ...: set affinity failed(-22)" warning.
> 
> Remove .irq_set_affinity implementation which only return -EINVAL from this
> controller driver.
> 
> Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>

Reviewed-by: Florian Fainelli <florian.fainelli@broadcom.com>
-- 
Florian


