Return-Path: <SRS0=FJ4T=K2=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.7 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8F7A9C47080
	for <linux-mediatek@archiver.kernel.org>; Mon, 31 May 2021 16:05:51 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5419461370
	for <linux-mediatek@archiver.kernel.org>; Mon, 31 May 2021 16:05:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5419461370
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:Cc:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=YSStSn/XRyC0QToertwrfRWNT1CdOPnnVctjaMOrqGw=; b=Ltjq8GXSuNyy59
	hNF4BuNSj5XxZklfWO4Qo0Auv7BCxcKmWU/yanRFYMiTYw/Qd3SLO4ah+T3N6JJ6LFRODnu5vZVPV
	nfWFOQyqhIXtVledADQ+f788xRyB9fINJCH1jw9FZfsv2tRjdCjEL8+3cnaJJeQ1dev05kyzusYGv
	QBbwmVQHytiPawplvsGABcUk8QCXYw+XD5hOqTqP0jfGLE2fAXgEMBsQ1cBvtKgZyauGElr5o/8Wg
	bM/Tz563BJPjh9mWvdj9hCF8LWnl/7CItcDS2/3hV+jI97D4ofRbnxU0AZ8p1O1zwEXHd1RkG3sIs
	RmCPy30ufE7luXL1QWOQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lnkQB-00CnL1-Un; Mon, 31 May 2021 16:05:43 +0000
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lnkPw-00CnGo-Vd; Mon, 31 May 2021 16:05:30 +0000
Received: by mail-wr1-x42d.google.com with SMTP id z8so6292358wrp.12;
 Mon, 31 May 2021 09:05:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=message-id:subject:from:to:cc:date:in-reply-to:references
 :user-agent:mime-version:content-transfer-encoding;
 bh=Qc6CI/WXrqiqEChpYGorO6MkwQYDxw3uL16JCZvhWUM=;
 b=qCqJmtounWoHmySgIWFJx3GKQV1ZiTAr7/JgogeudF/5uBOPGllZYzdTYWU/SNLtgT
 RFRUeX6e7Wn0Y5gWuSrLxBOssFS9XD+TbSx03mhlnX7E/ZNtb4FwMRxjeqTQIZVB/KcU
 jo2+TuM3l/MXi3LaRGsCYqa4Te5vQ0tN1Nhcpf2M17WerAVT+fYlBMtmIZsrdam+1jze
 kIUs7FEgxl5vbh9JpnVM6JxYogFNGFm3PS4IvV03T57NtWUY1rWYacKXYMqcKdToyK9F
 cAMU2F38vcSAtuzA2D/OcQhbAYOoy3Sv09I1SKsfUZmxgLccZ3Q6bFrunv2EPkT/2Kb8
 J6Ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
 :references:user-agent:mime-version:content-transfer-encoding;
 bh=Qc6CI/WXrqiqEChpYGorO6MkwQYDxw3uL16JCZvhWUM=;
 b=WUAVaIySp4FZDZdWjy8asuVxWd+QlMqrgLG+EClGgSbVutOFjlIfJ2osdVawSK/lfb
 tAywU4dsMgDrws8P2Ob7Ac+Ilk7Zi8dmt4ad0uHj4NIg8MsrOTVF+/Oy9RCUP6LNa6Ox
 BsTuGi4lvWFB7hQNFo5SvOX93PddzQyKU+uKc8WctAMD9kZ2EsGST6GwtNy1ZR1RE4qe
 bquj99n3KKZA31DLrZXH0KbCAVZSZaMpL5VAhTwnZS8+CkTmUlpMxxt9MClvrZcqQCGx
 Tv06TMLqey9ma0LL9TZO/PDISAkmHB6pOiLPO65YlWyKCM2EjTJyhzm1H9IF1UMLZ/X6
 zxBQ==
X-Gm-Message-State: AOAM533YI7yBka208f7ZSYQXeSfh4jmXFIKiQ7XYN96WyuPnuxxx9i/n
 nFZ1aYFqxgIIpfE3XFHpEUc=
X-Google-Smtp-Source: ABdhPJzyI+GMUKWGdnluF3L0hbXzLcnYFP6YTTjFJAKEmHNmyYxDt4HnS2Vpf8+CZDWtmk++b7GLbA==
X-Received: by 2002:adf:d1c2:: with SMTP id b2mr23013384wrd.407.1622477125656; 
 Mon, 31 May 2021 09:05:25 -0700 (PDT)
Received: from ubuntu-laptop (ip5f5bec5d.dynamic.kabel-deutschland.de.
 [95.91.236.93])
 by smtp.googlemail.com with ESMTPSA id b10sm128238wrt.24.2021.05.31.09.05.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 31 May 2021 09:05:25 -0700 (PDT)
Message-ID: <88dc0251ee98aee5af2217f5d864f0a893dbdef8.camel@gmail.com>
Subject: Re: [PATCH v1 3/3] scsi: ufs: Utilize Transfer Request List
 Completion Notification Register
From: Bean Huo <huobean@gmail.com>
To: Can Guo <cang@codeaurora.org>, asutoshd@codeaurora.org, 
 nguyenb@codeaurora.org, hongwus@codeaurora.org, linux-scsi@vger.kernel.org,
 kernel-team@android.com
Cc: Stanley Chu <stanley.chu@mediatek.com>, Alim Akhtar
 <alim.akhtar@samsung.com>, Avri Altman <avri.altman@wdc.com>, "James E.J.
 Bottomley" <jejb@linux.ibm.com>, "Martin K. Petersen"
 <martin.petersen@oracle.com>, Matthias Brugger <matthias.bgg@gmail.com>,
 Bean Huo <beanhuo@micron.com>, Jaegeuk Kim <jaegeuk@kernel.org>, Adrian
 Hunter <adrian.hunter@intel.com>, Kiwoong Kim <kwmad.kim@samsung.com>,
 Satya Tangirala <satyat@google.com>, "Gustavo A. R. Silva"
 <gustavoars@kernel.org>, Caleb Connolly <caleb@connolly.tech>, open list
 <linux-kernel@vger.kernel.org>, "moderated list:ARM/Mediatek SoC support"
 <linux-arm-kernel@lists.infradead.org>, "moderated list:ARM/Mediatek SoC
 support" <linux-mediatek@lists.infradead.org>
Date: Mon, 31 May 2021 18:05:24 +0200
In-Reply-To: <1621845419-14194-4-git-send-email-cang@codeaurora.org>
References: <1621845419-14194-1-git-send-email-cang@codeaurora.org>
 <1621845419-14194-4-git-send-email-cang@codeaurora.org>
User-Agent: Evolution 3.36.4-0ubuntu1 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210531_090529_067470_58648CBF 
X-CRM114-Status: GOOD (  12.68  )
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

On Mon, 2021-05-24 at 01:36 -0700, Can Guo wrote:
> By reading the UTP Transfer Request List Completion Notification
> Register,
> 
> which is added in UFSHCI Ver 3.0, SW can easily get the compeleted
> transfer
> 
> requests. Thus, SW can get rid of host lock, which is used to
> synchronize
> 
> the tr_doorbell and outstanding_reqs, on transfer requests dispatch
> and
> 
> completion paths. This can further benefit random read/write
> performance.
> 
> 
> 
> Cc: Stanley Chu <stanley.chu@mediatek.com>
> 
> Co-developed-by: Asutosh Das <asutoshd@codeaurora.org>
> 
> Signed-off-by: Asutosh Das <asutoshd@codeaurora.org>
> 
> Signed-off-by: Can Guo <cang@codeaurora.org>

Reviewed-by: Bean Huo <beanhuo@micron.com>


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
