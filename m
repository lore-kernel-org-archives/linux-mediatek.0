Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3A9BAC4332F
	for <linux-mediatek@archiver.kernel.org>; Fri, 30 Sep 2022 20:43:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uoEBw3W7OsVpJKjKmaRc7fAyy8A7s8XC6z9MFE/z6qU=; b=dNBfkAnC0EcBiTEV7zvkNFO0nr
	29uzzG1ZVxjSLFdUytCcYifR0L5MLVHVRqOksBxKXtc2/kTVkPzSxEhW9wNpi8NXGteMXxR4b6keJ
	EFYgdO1qgx3+KMzxg9xMBoK/Q8oZ/KkCQbVEcylDDafQ2PdlJyKxUjDJP5z9QKdgPzAE1asiiE/G9
	dP1YCXcbA6p49FLRNc3VV3xK5lFPCkleJG2vDCicOUe46TZYdVrM5Ohzu8abU2pVReOS32O6wbggh
	+GdX8NVvS912oF+G7lfGrfVWOd/wZTe2VUCyrxPmSz0Dfb6Y+iuarmzLw/dsuWPk2JQyhMAlH5bB/
	ZZsAGaWQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oeMr4-00BTBy-Dl; Fri, 30 Sep 2022 20:43:30 +0000
Received: from mail-pj1-f42.google.com ([209.85.216.42])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oeMqt-00BT5o-Hl; Fri, 30 Sep 2022 20:43:20 +0000
Received: by mail-pj1-f42.google.com with SMTP id x1-20020a17090ab00100b001fda21bbc90so10146618pjq.3;
        Fri, 30 Sep 2022 13:43:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date;
        bh=uoEBw3W7OsVpJKjKmaRc7fAyy8A7s8XC6z9MFE/z6qU=;
        b=O3q4xd8+seP81/tFKSW0bJsSi333IUtgZdLd6xAfXrZab/JTANNejEeaOQg76wuiiw
         bISJbxbr0w+sqayYIvg/+EGohqff/d/ytvQRTq1uTzNAV4Tw2SZNA5XfjFq8wkiaj9gL
         dRo3299jaoI7wkHVBT6F23+Xc55t+BKTvHFCzCVXPHy8f6aB1DFdFU+3dNn0uau0JjJo
         h3roFj43B+T2BSEkep/3PjGqGpixj4ptJbljzlKfZHiaD9VpYKyX5EGWeFJPOd+OM7IK
         A+wLjU79Y3RBGuscW7rLGNgbrR9FDEGlyUaRmD92+ygOQqKGTFIAukt/NiF1RchjXDZU
         EwQA==
X-Gm-Message-State: ACrzQf2QRddUMe3ZOR94ahf/KjeoJ6hUsTdzH4JrpBFgfDvg9QW776Wa
	Z2MvQEwJDxnNUcfNwrZBXfc=
X-Google-Smtp-Source: AMsMyM4oysXNB5xj/YYoe4sPyHFFiEwustUoMOQMKZ2ye4ucnpG1LlnuIPuKoUzQJwSRc3nqWkpQKQ==
X-Received: by 2002:a17:902:d4c2:b0:17c:9872:4b50 with SMTP id o2-20020a170902d4c200b0017c98724b50mr4077985plg.146.1664570596289;
        Fri, 30 Sep 2022 13:43:16 -0700 (PDT)
Received: from ?IPV6:2620:15c:211:201:9b89:d9c:f74c:7711? ([2620:15c:211:201:9b89:d9c:f74c:7711])
        by smtp.gmail.com with ESMTPSA id ix11-20020a170902f80b00b0016ee4b0bd60sm2326691plb.166.2022.09.30.13.43.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 30 Sep 2022 13:43:15 -0700 (PDT)
Message-ID: <10da95ab-f4f8-f079-d4c5-863e134ecf1e@acm.org>
Date: Fri, 30 Sep 2022 13:43:11 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH v1 12/16] ufs: core: Prepare for completion in mcq
Content-Language: en-US
To: Asutosh Das <quic_asutoshd@quicinc.com>, mani@kernel.org,
 quic_nguyenb@quicinc.com, quic_xiaosenh@quicinc.com, quic_cang@quicinc.com,
 quic_nitirawa@quicinc.com, quic_rampraka@quicinc.com,
 quic_richardp@quicinc.com, stanley.chu@mediatek.com,
 adrian.hunter@intel.com, avri.altman@wdc.com, beanhuo@micron.com,
 martin.petersen@oracle.com
Cc: linux-scsi@vger.kernel.org, Alim Akhtar <alim.akhtar@samsung.com>,
 "James E.J. Bottomley" <jejb@linux.ibm.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 open list <linux-kernel@vger.kernel.org>,
 "moderated list:ARM/Mediatek SoC support"
 <linux-arm-kernel@lists.infradead.org>,
 "moderated list:ARM/Mediatek SoC support"
 <linux-mediatek@lists.infradead.org>
References: <cover.1663894792.git.quic_asutoshd@quicinc.com>
 <21bb8fc81fa4394645cd6719374eee3a5d605c2d.1663894792.git.quic_asutoshd@quicinc.com>
From: Bart Van Assche <bvanassche@acm.org>
In-Reply-To: <21bb8fc81fa4394645cd6719374eee3a5d605c2d.1663894792.git.quic_asutoshd@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220930_134319_616971_988F3843 
X-CRM114-Status: UNSURE (   7.62  )
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

On 9/22/22 18:05, Asutosh Das wrote:
> Modifies completion path APIs and adds completion queue
> entry.

Please use the imperative mood for patch descriptions.

Thanks,

Bart.

