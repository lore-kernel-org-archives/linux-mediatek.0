Return-Path: <SRS0=zNLT=LW=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D885EC11F64
	for <linux-mediatek@archiver.kernel.org>; Mon, 28 Jun 2021 22:58:41 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6CA6D61CF8
	for <linux-mediatek@archiver.kernel.org>; Mon, 28 Jun 2021 22:58:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6CA6D61CF8
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=acm.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:Cc:To:Subject:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=AC7ZB7x4KpZWNYqVxQf9dPgDb9utWUJNfYYECxbsCUA=; b=otMMMbolOoPnoM+Kh3BWnvSEUG
	Nujx9CT13qpjT2mrZ94w/jhVE4mxG8+ZBXiWIX6wpSgKaA04Z7CzNpictKWaN1Nd+x/ocgmgBX3Xa
	WfAGOBW3pojQTUCIfjLOFZW1vuHPpxc8KlIKdx1aCbdetuio0YQxywK7pO7fZVUy0B2aHtZyftWhs
	OU5cgx/yigCQV+Ft6sTO2ehntXGUNgVTh4WkIJ9jRpwF8tvh7F2PTngWr/4dxDsXNnT9TapvSnZ58
	qERfkp1DTPxStLFmP2+fpaSdNFq3HUQpK0fjyBENzOlUNdCCY5RgDxsSCOjmzha9v2EZaSP7HF7Ep
	KJFCgSjg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ly0Ct-009Jqe-Vt; Mon, 28 Jun 2021 22:58:24 +0000
Received: from mail-pj1-f51.google.com ([209.85.216.51])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ly0Cr-009JqE-PX; Mon, 28 Jun 2021 22:58:23 +0000
Received: by mail-pj1-f51.google.com with SMTP id l11so11169371pji.5;
 Mon, 28 Jun 2021 15:58:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=rQuHayracZCE5AuUCtlx0qvA9ABrKm6B8angLYVYEb8=;
 b=hlkmsveuEx1atAVekWaJiDPjMUCOsAsaqRNdpCyWl5zsX48WNNF/llvXeRREouA3dv
 40NQwraMofxhPldhLB1ZianZ+eLp6jt/n9iIPs+/X12xn1ApR4iCabFqiY8ALWMNDuzV
 Id6F6PM9drF8ChzfshNj7qapoUORhwRmN8C+KuqXzT3Ytbl6mP0sYWDBB0B8kSmTBwnG
 TgMz6SnSbzp0EkNq2Yqxtaaf6VTD41m4QSp6UXC2JHgN9uSj7d/ti1YkebLQfjE7/jKb
 fKySPL+OaOTmSYgA9OYj0KrDixjW5OFiettcAki+aqj5W9om4PcT5EyJ7Fni66xnb7po
 eSYw==
X-Gm-Message-State: AOAM530HiDp2DDijOzpslUzT9HVwCmFz4uqq9Ne8KHH0oTs/y+tpXV5W
 Q9X+eEGisySH0Uu1rLJKSoDkxJPI5Ew=
X-Google-Smtp-Source: ABdhPJz773sQaKjTR5hTU6DS1WBDs3TNuXe56ia4TXreDfc9a6mue8ULUPDkwYnIqfXr3zNFkEc4Vg==
X-Received: by 2002:a17:90b:11d1:: with SMTP id
 gv17mr9094474pjb.230.1624921098509; 
 Mon, 28 Jun 2021 15:58:18 -0700 (PDT)
Received: from [192.168.3.217] (c-73-241-217-19.hsd1.ca.comcast.net.
 [73.241.217.19])
 by smtp.gmail.com with ESMTPSA id s79sm8460998pfc.87.2021.06.28.15.58.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 28 Jun 2021 15:58:17 -0700 (PDT)
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
Message-ID: <c31185f5-e816-937d-25ac-1657b6111ff8@acm.org>
Date: Mon, 28 Jun 2021 15:58:15 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <1621845419-14194-3-git-send-email-cang@codeaurora.org>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210628_155821_887054_164CB7F1 
X-CRM114-Status: GOOD (  13.49  )
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

Since this patch has been applied on the AOSP kernel we see 100%
reproducible lockups appearing on multiple test setups. Examples of call
traces:

blk_execute_rq()
__scsi_execute()
sd_sync_cache()
sd_suspend_common()
sd_suspend_system()
scsi_bus_suspend()
__device_suspend()

blk_execute_rq()
__scsi_execute()
ufshcd_clear_ua_wlun()
ufshcd_err_handling_unprepare()
ufshcd_err_handler()
process_one_work()

Reverting this patch and the next patch from this series solved the
lockups. Do you prefer to revert this patch or do you perhaps want us to
test a potential fix?

Thanks,

Bart.


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
