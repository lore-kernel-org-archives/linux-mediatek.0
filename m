Return-Path: <SRS0=bWHh=K5=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4BF3BC4708F
	for <linux-mediatek@archiver.kernel.org>; Thu,  3 Jun 2021 00:21:13 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 12F166100A
	for <linux-mediatek@archiver.kernel.org>; Thu,  3 Jun 2021 00:21:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 12F166100A
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=acm.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:Cc:To:Subject:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=ZrK9fbsYafDB3MaC4xFWLzv/JKukwL5/S7xEsQ/W+iE=; b=qNtQ7pp0XTmoCOTXcRR8fJpT11
	+kNo+6+eZsJa8gE3GKtgU+oHFbQb+Di1pn8n5058tOMpsyT7xBTXshoTbtCzoFHp7CGbTx4EGVYvv
	nyk9du62+NPVQ2rL0n9UiZHIQss7LeJkLiKBPQ5ufabHVG9acMN+eynJeB9+pZNzzIcUXMvl0s5Oa
	9EpMgd4EVER/zW1CApRcdIlvVBJUbS0D9vouZUfrdnXW0MY1ByDRN0ceeRWCp6TwdYsLyvKf42GQZ
	LdaE6MjaaD9yeTVV4wTKjXqWIUpzW4C+PEJWu0vob+fAwIfxUGBRk5CLnxZ25UJRT0tlNFFw2cDfm
	IlfS8o3Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lob6d-006bGe-04; Thu, 03 Jun 2021 00:21:03 +0000
Received: from mail-pl1-f170.google.com ([209.85.214.170])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lob6Z-006aw3-61; Thu, 03 Jun 2021 00:21:00 +0000
Received: by mail-pl1-f170.google.com with SMTP id h12so1963217plf.11;
 Wed, 02 Jun 2021 17:18:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=J5zd1hQ722vpm1HO3eh2WAzXPsJQcOGu8eyeuVd42ws=;
 b=Spzb72thZuCx3bLe5Km/6O6KSCrOD581ovZByty4zf4aX7fQjwIk2zbmWwTh/D/B6E
 bnwjyaEtGXkAHc0ncFkbprNxj8Fa3Hz6u7BDWx5Kzy3lR91xTayRY7RQUeFiDs4S6Otv
 CdqnfVmHNdWLqP/nUjMqZhqUC2JHmGJ3fqrtrfesLBNVLou4UjEXZtKe7V+GtDAffyYZ
 5vSv9y8LTges3A7M5dCv8qM3hF2vUGO+9kuIOQofHyeGlVQP/SKSShcGCAHiJKzzkIKY
 tg3e5SVJxJPXlz3/VOKPKpaPF80zCWHv1JBQ66qMLp/Pm/6LvCejEunkBJEIBCgV9VCt
 15VA==
X-Gm-Message-State: AOAM533cNLVnu07JCh4kjKj1ckXlJW0lSORatthG7sTkasLUQ/Zw8u3v
 BHLdUpuwnmcw4cpWO0/knPtDuS7BTi99qA==
X-Google-Smtp-Source: ABdhPJyluBOAMWA/V2/RAthcvrAXnZ9wwZk0KipnaoZNTQWPqtc0SjnM7Pu8HK2uBGzRggYYyo6+0w==
X-Received: by 2002:a17:90a:414d:: with SMTP id
 m13mr7956152pjg.115.1622679535334; 
 Wed, 02 Jun 2021 17:18:55 -0700 (PDT)
Received: from [192.168.3.217] (c-73-241-217-19.hsd1.ca.comcast.net.
 [73.241.217.19])
 by smtp.gmail.com with ESMTPSA id h8sm547606pfv.60.2021.06.02.17.18.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 02 Jun 2021 17:18:54 -0700 (PDT)
Subject: Re: [PATCH v1 2/3] scsi: ufs: Optimize host lock on transfer requests
 send/compl paths
To: Bean Huo <huobean@gmail.com>, Can Guo <cang@codeaurora.org>,
 asutoshd@codeaurora.org, nguyenb@codeaurora.org, hongwus@codeaurora.org,
 linux-scsi@vger.kernel.org, kernel-team@android.com
Cc: Stanley Chu <stanley.chu@mediatek.com>,
 Alim Akhtar <alim.akhtar@samsung.com>, Avri Altman <avri.altman@wdc.com>,
 "James E.J. Bottomley" <jejb@linux.ibm.com>,
 "Martin K. Petersen" <martin.petersen@oracle.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, Bean Huo <beanhuo@micron.com>,
 Jaegeuk Kim <jaegeuk@kernel.org>, Adrian Hunter <adrian.hunter@intel.com>,
 Kiwoong Kim <kwmad.kim@samsung.com>, Satya Tangirala <satyat@google.com>,
 open list <linux-kernel@vger.kernel.org>,
 "moderated list:ARM/Mediatek SoC support"
 <linux-arm-kernel@lists.infradead.org>,
 "moderated list:ARM/Mediatek SoC support"
 <linux-mediatek@lists.infradead.org>
References: <1621845419-14194-1-git-send-email-cang@codeaurora.org>
 <1621845419-14194-3-git-send-email-cang@codeaurora.org>
 <6d6d296a84f1e62f65fda4d172a85bb35d9a3684.camel@gmail.com>
From: Bart Van Assche <bvanassche@acm.org>
Message-ID: <200da9c5-ea20-819e-2b11-7f45e8b05cbb@acm.org>
Date: Wed, 2 Jun 2021 17:18:51 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.2
MIME-Version: 1.0
In-Reply-To: <6d6d296a84f1e62f65fda4d172a85bb35d9a3684.camel@gmail.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210602_172059_259640_1ABFF875 
X-CRM114-Status: GOOD (  15.70  )
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

On 5/31/21 9:04 AM, Bean Huo wrote:
> I did a UFS queue limitation test before, observed that once the
> queue is full, then the active task number in the queue will get
> down. For the Nvme, the scenario is the same. You can refer to the
> slide 23, and slide 24 in the pdf: 
> https://elinux.org/images/6/6c/Linux_Storage_System_Bottleneck_Exploration_V0.3.pdf
> I don't know if your patch can fix this issue.

Hi Bean,

That's a very interesting presentation. Unfortunately the overhead for
SCSI in that presentation includes the SCSI core + UFS driver. Given the
use of the host lock in the version of the UFS driver that was used to
prepare that presentation, the overhead introduced by the UFS driver may
be significant. Maybe someone should measure the overhead of the
scsi_debug driver and compare it with the NVMe loopback driver to get a
better idea of how the overhead of these two subsystems compare to each
other?

Bart.

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
