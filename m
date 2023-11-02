Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 95697C4167B
	for <linux-mediatek@archiver.kernel.org>; Thu,  2 Nov 2023 19:16:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Hi2EMa2JURthjzhOMbj1ijk40LtXcNMKHU4qr6uWg4k=; b=U5aUnqOaS01BUWCYWn7Q66wYuw
	MNw51IW9sFgAwtJnW4og3dIdnrnNSvMCY0dtF/w34arySgDqYgom/2iUGMulVtCoEVHZsHlnLGZQV
	pkL67fokbpDNPpu6pcgvhDM3/THs8zDludz6hVcsFXV70DQcWHA5KMDYb0U3MPFOx7lwyMxG+x4JC
	ruEE1mtKvHkxOHbsnTdlKRhiNbntWU2RaUieiyVQV219pWBXKFpbJbWQ4D6LnM/2edPT2g/jceDac
	IxUH4wtc3eehThF6+0S0fChTIMWwlGZkI06kg1r0/M3Crysp6+rjTP8r9Hdc7b/J1Xf9d7AYwdPWK
	UUZQSapg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qydB1-00A9NL-2C;
	Thu, 02 Nov 2023 19:16:23 +0000
Received: from mail-pl1-f174.google.com ([209.85.214.174])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qydAy-00A9MQ-2f;
	Thu, 02 Nov 2023 19:16:21 +0000
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-1cc3542e328so10300245ad.1;
        Thu, 02 Nov 2023 12:16:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698952579; x=1699557379;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Hi2EMa2JURthjzhOMbj1ijk40LtXcNMKHU4qr6uWg4k=;
        b=pYqfhICtFD58Dj2RD0ZjMuNxL8xRiSMkyi5T8Sx/cjCrUR8UVMi27NRaZty4oEItgq
         pfHgh1+upUtYxBV+y/N/yBZ/qWmPbS1mgxDBCbcNNAoxwwBo5BfTLVCIdUFlzK9HdWkZ
         gqRDqtzDm/3iz8YqoEAW1pMmUts+J7e6YWnSkfABM9ic8ZLmqbwSWrVVl3H7Qh+QMIK7
         0boZCQMh5KADwpvigP+mGxoC+8glm6WOko1njz+qxLrQiydj0XOljw2cv9FlNEu8SiOt
         iZPn+7aaIgX6LYNiRo8c4oE7EWoC63XutuaSCSmdgWe6/oJHZiufOdCrCEUyGGSImxJJ
         HRGg==
X-Gm-Message-State: AOJu0YxZlG1oyVaoeY4nK+NXU9ssIRPzz4K3v8XU7x+407uus5osgH4M
	Gw3Qyo4KRyC9fVb8maIdLpE=
X-Google-Smtp-Source: AGHT+IGL/Lvym+pJN7/UXiKk8dNV2PsHrB+kPmFxLCSFa0qX8f29Kz0grAvKniaRmcIzpsPEp/4eBA==
X-Received: by 2002:a17:903:32cc:b0:1cc:45d0:46fc with SMTP id i12-20020a17090332cc00b001cc45d046fcmr13519966plr.54.1698952578726;
        Thu, 02 Nov 2023 12:16:18 -0700 (PDT)
Received: from ?IPV6:2620:15c:211:201:87f7:9784:4475:1cd4? ([2620:15c:211:201:87f7:9784:4475:1cd4])
        by smtp.gmail.com with ESMTPSA id e5-20020a170902744500b001c60ba709b7sm80157plt.125.2023.11.02.12.16.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 02 Nov 2023 12:16:18 -0700 (PDT)
Message-ID: <45495479-dc4e-4d89-8c0d-836df83ee18a@acm.org>
Date: Thu, 2 Nov 2023 12:16:15 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/1] ufs: core: Expand MCQ queue slot to
 DeviceQueueDepth + 1
Content-Language: en-US
To: naomi.chu@mediatek.com, linux-scsi@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, Alim Akhtar <alim.akhtar@samsung.com>,
 Avri Altman <avri.altman@wdc.com>, "James E.J. Bottomley"
 <jejb@linux.ibm.com>, "Martin K. Petersen" <martin.petersen@oracle.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Manivannan Sadhasivam <mani@kernel.org>,
 Asutosh Das <quic_asutoshd@quicinc.com>, Can Guo <quic_cang@quicinc.com>
Cc: wsd_upstream@mediatek.com, peter.wang@mediatek.com,
 casper.li@mediatek.com, powen.kao@mediatek.com, alice.chao@mediatek.com,
 chun-hung.wu@mediatek.com, cc.chou@mediatek.com, eddie.huang@mediatek.com
References: <20231102052426.12006-1-naomi.chu@mediatek.com>
 <20231102052426.12006-2-naomi.chu@mediatek.com>
From: Bart Van Assche <bvanassche@acm.org>
In-Reply-To: <20231102052426.12006-2-naomi.chu@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231102_121620_861880_B9AD9DCB 
X-CRM114-Status: UNSURE (   8.13  )
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

On 11/1/23 22:24, naomi.chu@mediatek.com wrote:
> The UFSHCI 4.0 specification mandates that there should always be at
> least one empty slot in each queue for distinguishing between full and
> empty states. Enlarge the `hwq->max_entries` to `DeviceQueueDepth +1`
> to allow UFSHCI 4.0 controllers to fully utilize MCQ queue slots.

Reviewed-by: Bart Van Assche <bvanassche@acm.org>

