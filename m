Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 798B4C4321E
	for <linux-mediatek@archiver.kernel.org>; Sun,  4 Dec 2022 19:25:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3vGbnOeq4kzljzirvL5pjkAxrpSozfhAG6ODaOPHYw4=; b=HU3+/1y7r4RIJ2sk9h0c44x9XD
	j/9unAzzUih5NWFfXrL7NOlFB0VwvAj2hki72fQ8Dw0DYn60sx89P/suXYBSJ3UAh5Y9foMoeSXrM
	/X2SlgXJ1VjyiUd4xK5phe4Z5GS0ShIoTLj69SFvnfe9WSaVpSkwYG+AEBoc5MJ3nRgfzHo29l5RJ
	3OKk8ubChlmQlxLDghun070BgqGSwKvKxfD3UwJ3ODV6di8tj+SqtML8a+q9F/bD2A/66rnNXvUuC
	MhYQSttsxbk8qbXS8RwUWiQYRHJqur8u2IRl82vB73Gg4ykBabycGPnD7dxhreDmqHviRsKQrUiA3
	pfQRmvNg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p1ucD-00At9T-78; Sun, 04 Dec 2022 19:25:29 +0000
Received: from mail-ej1-x630.google.com ([2a00:1450:4864:20::630])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p1uC3-00ASRY-Oh
	for linux-mediatek@lists.infradead.org; Sun, 04 Dec 2022 18:58:29 +0000
Received: by mail-ej1-x630.google.com with SMTP id vp12so23039580ejc.8
        for <linux-mediatek@lists.infradead.org>; Sun, 04 Dec 2022 10:58:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=3vGbnOeq4kzljzirvL5pjkAxrpSozfhAG6ODaOPHYw4=;
        b=SK+J0e+cOF/gJbHdLxeV7lh37lbbvFSCOUHLAc5Bz2c7Gep4IX9vNEDlsq1rBER3C9
         eEcrqt9aSrGir+v/mK8rWOSE1jU9xY5I21o+B3WyW646xZ7o9EgWPM38Z669uLk1lY/R
         53Aer7L/UtA27fo/AQqxuehOcbxuyp1m9zqC1HD56dGoQs7j7wHg0FhAePCMOd+LNof3
         8lk7yILEv2YOHjyedBQg/rDiGO+pST3ju+QQScTTp7TRZjiK7lRrkUdvAPGeS8zvpHh/
         QXvs8k/MigJPFlxy3U46QJDTSyfqvsC+NlK6x+lXXLix61KS4vv08Ni8b9vFUX8OFNu+
         2qEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=3vGbnOeq4kzljzirvL5pjkAxrpSozfhAG6ODaOPHYw4=;
        b=bcwfjsq9NkfWkbFehZsz1PHzmSJN+gkTbjtJ8BqJstLqrtGwlMfPWp8libFbJZRW6O
         U03LsPTHm0m0E/UU+mZS0YZgQOaHKBZ6Qv27ai8X7RRbg+w7qKYW2YBOHHzP77y225Sd
         EcoBujekMcMPIRpWzPwZQ4DT0rwuy1S8oUGknjevPDAVnAHQQTNUim/zJWr/oKn2RbCS
         poaeDV4G3FrHmmmQv3RrlB+swRoQzaO05m/ssBMOj9Ujbdl+ttKZP2E9Mx7zG/vvWEj3
         64aCCPC/2Xwr3zMV+q+lY29GynoyFx4WhKmVHXchASrs6xlFVRPAUqH+J8n9PfSYdthe
         e4jg==
X-Gm-Message-State: ANoB5plaIrhU5c0kqU8NjZe2xvrYumiW8F686YrpenAq58j7eEGVmzJ6
	l1Cpj3sEh+u0wG87QPOHoDY=
X-Google-Smtp-Source: AA0mqf5Gj2MsqoFIDKKOFMrWYTOn+mbcGYyONEEDMSyUgTJV4h6G/l5VpcvYCMpWn0W7OFj1jdllyw==
X-Received: by 2002:a17:906:7953:b0:7bf:944e:cf6e with SMTP id l19-20020a170906795300b007bf944ecf6emr28321277ejo.638.1670180306173;
        Sun, 04 Dec 2022 10:58:26 -0800 (PST)
Received: from [192.168.1.101] ([37.252.91.128])
        by smtp.gmail.com with ESMTPSA id 14-20020a170906318e00b007aed2057ea1sm5342266ejy.167.2022.12.04.10.58.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 04 Dec 2022 10:58:25 -0800 (PST)
Message-ID: <14db8809-6144-1d10-59e7-298079b2e6e2@gmail.com>
Date: Sun, 4 Dec 2022 22:58:21 +0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Subject: Re: [PATCH net-next v1 02/13] net: wwan: tmi: Add buffer management
Content-Language: en-US
To: Yanchao Yang <yanchao.yang@mediatek.com>,
 Loic Poulain <loic.poulain@linaro.org>,
 Johannes Berg <johannes@sipsolutions.net>,
 "David S . Miller" <davem@davemloft.net>, Eric Dumazet
 <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, netdev ML <netdev@vger.kernel.org>,
 kernel ML <linux-kernel@vger.kernel.org>
Cc: MTK ML <linux-mediatek@lists.infradead.org>,
 Liang Lu <liang.lu@mediatek.com>, Haijun Liu <haijun.liu@mediatek.com>,
 Hua Yang <hua.yang@mediatek.com>, Ting Wang <ting.wang@mediatek.com>,
 Felix Chen <felix.chen@mediatek.com>,
 Mingliang Xu <mingliang.xu@mediatek.com>, Min Dong <min.dong@mediatek.com>,
 Aiden Wang <aiden.wang@mediatek.com>,
 Guohao Zhang <guohao.zhang@mediatek.com>,
 Chris Feng <chris.feng@mediatek.com>,
 Lambert Wang <lambert.wang@mediatek.com>,
 Mingchuang Qiao <mingchuang.qiao@mediatek.com>,
 Xiayu Zhang <xiayu.zhang@mediatek.com>,
 Haozhe Chang <haozhe.chang@mediatek.com>,
 MediaTek Corporation <linuxwwan@mediatek.com>
References: <20221122111152.160377-1-yanchao.yang@mediatek.com>
 <20221122111152.160377-3-yanchao.yang@mediatek.com>
From: Sergey Ryazanov <ryazanov.s.a@gmail.com>
In-Reply-To: <20221122111152.160377-3-yanchao.yang@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221204_105827_911789_C96B5B6D 
X-CRM114-Status: GOOD (  12.53  )
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

On 22.11.2022 15:11, Yanchao Yang wrote:
> From: MediaTek Corporation <linuxwwan@mediatek.com>
> 
> To malloc I/O memory as soon as possible, buffer management comes into being.
> It creates buffer pools that reserve some buffers through deferred works when
> the driver isn't busy.
> 
> The buffer management provides unified memory allocation/de-allocation
> interfaces for other modules. It supports two buffer types of SKB and page.
> Two reload work queues with different priority values are provided to meet
> various requirements of the control plane and the data plane.
> 
> When the reserved buffer count of the pool is less than a threshold (default
> is 2/3 of the pool size), the reload work will restart to allocate buffers
> from the OS until the buffer pool becomes full. When the buffer pool fills,
> the OS will recycle the buffer freed by the user.
> 
> Signed-off-by: Mingliang Xu <mingliang.xu@mediatek.com>
> Signed-off-by: MediaTek Corporation <linuxwwan@mediatek.com>
> ---
>   drivers/net/wwan/mediatek/Makefile  |   3 +-
>   drivers/net/wwan/mediatek/mtk_bm.c  | 369 ++++++++++++++++++++++++++++
>   drivers/net/wwan/mediatek/mtk_bm.h  |  79 ++++++
>   drivers/net/wwan/mediatek/mtk_dev.c |  11 +-
>   drivers/net/wwan/mediatek/mtk_dev.h |   1 +
>   5 files changed, 461 insertions(+), 2 deletions(-)
>   create mode 100644 drivers/net/wwan/mediatek/mtk_bm.c
>   create mode 100644 drivers/net/wwan/mediatek/mtk_bm.h

Yanchao, can you share some numbers, how this custom pool is outperform 
the regular kernel allocator?

--
Sergey

