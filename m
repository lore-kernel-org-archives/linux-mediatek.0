Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C522AC433F5
	for <linux-mediatek@archiver.kernel.org>; Fri, 30 Sep 2022 20:33:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yZ3CLoEWbUsNwnFTHokhMiNfQQdxMtKbg95qd8xX+Qs=; b=t7YfN1/7Vl77gs4nW64efEBQza
	f3y3GnhaEKn51fW7MbAZAYQqjkBVorqrGG9gbSRjCE9rSTy6maF0DasezVzRnvUj7k5E6Km44Q3Vy
	9qN/zNqO8M7ZjOTNmmG8rR/tWFvZ1AH1xuYB/Xcv3cQZOJTDp56jwXMGfQ7p9iws6ELbVpP/Er3Gv
	OWdIBzs9rghCh9dcYChSWKBAC/9Dpnk7bpEBq240mBsnQPlFLacoZ5EcEYYiM14Mwi+1MayqAixg8
	M0FKiNXrzJIBhfLSb15Ao1aHWSYrQwDQbxg4bdMrf/HwnPhqmFqVdAjpwiYONpWwarl5HXDmnAVOs
	do+KhX1g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oeMhB-00BQis-3Q; Fri, 30 Sep 2022 20:33:17 +0000
Received: from mail-pf1-f175.google.com ([209.85.210.175])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oeMh0-00BQew-As; Fri, 30 Sep 2022 20:33:07 +0000
Received: by mail-pf1-f175.google.com with SMTP id w2so5233323pfb.0;
        Fri, 30 Sep 2022 13:33:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date;
        bh=yZ3CLoEWbUsNwnFTHokhMiNfQQdxMtKbg95qd8xX+Qs=;
        b=ks62hmQaVV15UjP8RLLrD0LXzLuvXwV9P/1iY5Mk95gRoNMnH/Rb9Gg9qBz/Qmxh7k
         Y0i/VPiNkvXTuQrookJF+gee9khADcPs2ijoZ6L03hMcpwctvGmRKHnL+PIZl8TGbA4d
         fSgu8IC4g0haA/BVyPRa4QAwHIJI8TSjcfu/dAxzYhttocKIf0nBncRSDRrfM/i/XsWg
         H+zxjov5EDk/wTIMxa2prvZKJbBgWVtA23QxRCe+gSBI+/KJh235WyNIoVQmT5rrCAif
         9NTGFnj5PsVdxTga5HK5wfwQi15Ts0a1EoTob1XIdAbEg+MuTzxnmZiKf4CDrPj9H7Oz
         DxHA==
X-Gm-Message-State: ACrzQf0pkBTTSzdY/6CbDfLKTriZZoli00gaFfcwKIibwjBoMC6XWUWM
	T+Uw8i10r1eyy/F9mu8Jsls=
X-Google-Smtp-Source: AMsMyM7cg0Nv3Oa527FRcJVGwCF4Q6c3aQHYr58EDZimjc5R13fS3zWqoKMxu5ewbftHD+1yDp8sog==
X-Received: by 2002:a05:6a00:2314:b0:546:ce91:89a3 with SMTP id h20-20020a056a00231400b00546ce9189a3mr10703571pfh.77.1664569981596;
        Fri, 30 Sep 2022 13:33:01 -0700 (PDT)
Received: from ?IPV6:2620:15c:211:201:9b89:d9c:f74c:7711? ([2620:15c:211:201:9b89:d9c:f74c:7711])
        by smtp.gmail.com with ESMTPSA id im23-20020a170902bb1700b001755e4278a6sm2301441plb.261.2022.09.30.13.32.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 30 Sep 2022 13:33:00 -0700 (PDT)
Message-ID: <c3673ae6-4300-4709-febd-953552a9c81c@acm.org>
Date: Fri, 30 Sep 2022 13:32:57 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH v1 15/16] ufs: core: mcq: Enable Multi Circular Queue
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
 open list <linux-kernel@vger.kernel.org>,
 "moderated list:ARM/Mediatek SoC support"
 <linux-arm-kernel@lists.infradead.org>,
 "moderated list:ARM/Mediatek SoC support"
 <linux-mediatek@lists.infradead.org>
References: <cover.1663894792.git.quic_asutoshd@quicinc.com>
 <c670b4f07fec06652d281ff0a390f3d2ef347d70.1663894792.git.quic_asutoshd@quicinc.com>
From: Bart Van Assche <bvanassche@acm.org>
In-Reply-To: <c670b4f07fec06652d281ff0a390f3d2ef347d70.1663894792.git.quic_asutoshd@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220930_133306_397416_0FACE0DD 
X-CRM114-Status: UNSURE (   9.19  )
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
> MCQ is enabled in the Host Controller.

Patch descriptions should be written in the imperative mood so please 
change the above into something like the following:

Enable MCQ in the host controller.

Thanks,

Bart.


