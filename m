Return-Path: <SRS0=AnEI=KU=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 36074C2B9F7
	for <linux-mediatek@archiver.kernel.org>; Tue, 25 May 2021 01:38:20 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EF75861417
	for <linux-mediatek@archiver.kernel.org>; Tue, 25 May 2021 01:38:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org EF75861417
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=acm.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:Cc:To:Subject:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=Emi8leY/56/Twez++YvkVqenBF1d+ogososRRnc3vN8=; b=a5Dbof9VNX/ESk06aoKSmbuppK
	JxDIoZnpkS4v1HZd9rQwEFx519qWZnQCKF5aslXtmBflHnY2stG69QNOp5DNdlWm73thk0wBFmr0T
	Wo+Nhu7+Z9tCZxBvcLtlTcoEGbMYcybfoYAhLvlChLh8XyS6H6x5x/+8sy5OrL9aZ6tiEm3NRl3xU
	BQ5abbyvYTOOB++V8BQMuEGl4YDFoR+u07t2xFgeeVDHU/QFU5ZdZTaqpqz6xhf0mGUgFpDVwWblh
	jm9PWjEexDv9dXzHC3EQJZ1XFu3AtHfxrWBl+/wQMtus4p5iKg8dGmYtEYmAz9IO5BfOvXn+HeLuJ
	UxgpH2rQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1llM1H-002maM-7u; Tue, 25 May 2021 01:38:07 +0000
Received: from mail-pf1-f182.google.com ([209.85.210.182])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1llGug-001nJA-AM; Mon, 24 May 2021 20:11:00 +0000
Received: by mail-pf1-f182.google.com with SMTP id q67so4709736pfb.4;
 Mon, 24 May 2021 13:10:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=cZcmrRKl8MZj6EByHFj+TpMs1Z1/LuL5LS/wikT3fk4=;
 b=j45LmfOrw0szdelfYT2EP+ryhpbraejE8NLmaiPf+dj5j3O2C5QK+ED2blV0pzyJGk
 JYQwQN5L0sk6x2jfAECNBSzMUUviV82tG68E92Kf3o8qeeDga4Q0HYbft80tLpstijnS
 GCO6MMqbyK73tT9g1FZsGLp6HjXTo/n9bPD8ARRmr+dqd5tdSQraGEm0OJeI3FXz2jgJ
 OK1nfAhgtYxwrh3mw7NMhvQg4ssdzRsajMWAh0wnyDc3AgKeZBDAA5nJ3+RIFEueXy2d
 uIaozPEZ+vcBOlmaGQdRzeHWz2C+vWv6CrCUAeXH9WSQxyhreUd7bYGH5cc9qbBU8nZ3
 mkfg==
X-Gm-Message-State: AOAM533gBFx6Glrm821CZBLvVjunYKk5fhv8hahpiaFCPMJmuyuPicJM
 ApVyM012xkeFCHDwh0WLq3FX/1qYQTaIbA==
X-Google-Smtp-Source: ABdhPJxD4+pUlQXbF50GPoHknO4liqzl56WqMATugX+MXNqgIs5tXgBUmR5SEERjMs7Ux8i4dGIotQ==
X-Received: by 2002:aa7:9aed:0:b029:2e1:fdad:ac11 with SMTP id
 y13-20020aa79aed0000b02902e1fdadac11mr24869896pfp.58.1621887056093; 
 Mon, 24 May 2021 13:10:56 -0700 (PDT)
Received: from [192.168.3.217] (c-73-241-217-19.hsd1.ca.comcast.net.
 [73.241.217.19])
 by smtp.gmail.com with ESMTPSA id w125sm11621528pfw.214.2021.05.24.13.10.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 24 May 2021 13:10:55 -0700 (PDT)
Subject: Re: [PATCH v1 2/3] scsi: ufs: Optimize host lock on transfer requests
 send/compl paths
To: Can Guo <cang@codeaurora.org>, asutoshd@codeaurora.org,
 nguyenb@codeaurora.org, hongwus@codeaurora.org, linux-scsi@vger.kernel.org,
 kernel-team@android.com
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
From: Bart Van Assche <bvanassche@acm.org>
Message-ID: <41a08b3e-122d-4f1a-abbd-4b5730f880b2@acm.org>
Date: Mon, 24 May 2021 13:10:51 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.2
MIME-Version: 1.0
In-Reply-To: <1621845419-14194-3-git-send-email-cang@codeaurora.org>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210524_131058_440482_41C5E050 
X-CRM114-Status: GOOD (  14.82  )
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

On 5/24/21 1:36 AM, Can Guo wrote:
> Current UFS IRQ handler is completely wrapped by host lock, and because
> ufshcd_send_command() is also protected by host lock, when IRQ handler
> fires, not only the CPU running the IRQ handler cannot send new requests,
> the rest CPUs can neither. Move the host lock wrapping the IRQ handler into
> specific branches, i.e., ufshcd_uic_cmd_compl(), ufshcd_check_errors(),
> ufshcd_tmc_handler() and ufshcd_transfer_req_compl(). Meanwhile, to further
> reduce occpuation of host lock in ufshcd_transfer_req_compl(), host lock is
> no longer required to call __ufshcd_transfer_req_compl(). As per test, the
> optimization can bring considerable gain to random read/write performance.

Hi Can,

Using the host lock to serialize the completion path against the
submission path was a common practice 11 years ago, before the host lock
push-down (see also
https://linux-scsi.vger.kernel.narkive.com/UEmGgwAc/rfc-patch-scsi-host-lock-push-down).
Modern SCSI LLDs should not use the SCSI host lock. Please consider
introducing one or more new synchronization objects in struct ufs_hba
and to use these instead of the SCSI host lock. That will save multiple
pointer dereferences in the hot path since hba->host->host_lock will
become hba->new_spin_lock.

An additional question is whether it is necessary for v3.0 UFS devices
to serialize the submission path against the completion path? Multiple
high-performance SCSI LLDs support hardware with separate submission and
completion queues and hence do not need any serialization between the
submission and the completion path. I'm asking this because it is likely
that sooner or later multiqueue support will be added in the UFS
specification. Benefiting from multiqueue support will require to rework
locking in the UFS driver anyway.

Thanks,

Bart.

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
