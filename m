Return-Path: <SRS0=jcdg=LZ=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 79840C11F64
	for <linux-mediatek@archiver.kernel.org>; Thu,  1 Jul 2021 15:58:14 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 40BBE6141A
	for <linux-mediatek@archiver.kernel.org>; Thu,  1 Jul 2021 15:58:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 40BBE6141A
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=acm.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:Cc:To:Subject:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=jjlkoJWyKgoG+yRo4iFoSLqyRe15bBCm9bUz33k5L5Y=; b=xy8j5ViQdyUVb74NqcvtTrevpD
	bBTr8Vwa9p2K4ytX06/gqbkf20WpmPEqnQAvmDjlbxFddWUe1yn65alY8ykeFbprP0lpHSKXnsZME
	ehFITZ1NCNOjS00JHpvm2ukyhOqDScGL/irluy4kqYVtb3uzaZRx0uQrW9QOg6dqb7SkfPj9NwVz5
	P5iP/PNMgVaUIEmlCllcatVgWMfYEUAYERGXjeL8taoiukPD2sPdyPKkXWgqI+mhvQLSxDXIAdg8p
	Ke2anOB6dNx6OwMaLuXFhcF6i/FQWHCTjofBS0FrWyj+8Kk1t9JjyzuhK8QZhlCjYp3trn78d3vtq
	DaQdIfZw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lyz4m-000Kzj-Ql; Thu, 01 Jul 2021 15:58:04 +0000
Received: from mail-pj1-f41.google.com ([209.85.216.41])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lyz4k-000Kz0-Tm; Thu, 01 Jul 2021 15:58:04 +0000
Received: by mail-pj1-f41.google.com with SMTP id
 b8-20020a17090a4888b02901725eedd346so1290482pjh.4; 
 Thu, 01 Jul 2021 08:58:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=y8RJ7NHLUH0UkXZQbqLTPlcYrodTSF7e3TMEWx7woGM=;
 b=lgKtrOTR354tIL484FZY5jhlhGr2OY+30iCkGKlUekblasixw+Y3S/gy46AfDYkp9i
 nzIbc6JGdWDS7ED30XpK3OlSVIP0dhSQ4j/oyvK93V8OusWqMQRd31kvfDW+fbqRajnG
 tlwvFHP1b4RnzkvWP4dxxadoiPML32G8zdGxVDGGSrHz2IlTWP0MtwR79AZ+4Ng2uwJd
 fqM/6L76+rPEKs1ZRimgbgxZhC2Hj+UKW0+ax/0MTIKAk4QC9j/lJLjCBDRL+J0MJxoT
 rWJJOcSV+R+bvfLNXtxYAK9vjAMNw28OMcGaFlztfP9YrxJY9lZBlrqFJ3lA2QGvSpGc
 kBWA==
X-Gm-Message-State: AOAM532iLocPvSIArhAPtDlGILM1kzIGTv+PHVYrmXPywYf4PhVFXsuU
 MXp2eK4O579Ty9Gbpmyo448JEhJd594=
X-Google-Smtp-Source: ABdhPJzVG+t6KRlrq32BvCj+MdsP5nTMwJW2oiZ8u2tKUXjf6dvTOkgsc5cIk2jTuqU8K/ihKx43kg==
X-Received: by 2002:a17:90b:1944:: with SMTP id
 nk4mr420440pjb.66.1625155080441; 
 Thu, 01 Jul 2021 08:58:00 -0700 (PDT)
Received: from ?IPv6:2601:647:4000:d7:6a75:b07:a0d:8bd5?
 ([2601:647:4000:d7:6a75:b07:a0d:8bd5])
 by smtp.gmail.com with ESMTPSA id t6sm9984750pjo.4.2021.07.01.08.57.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 01 Jul 2021 08:57:59 -0700 (PDT)
Subject: Re: [PATCH v1 2/3] scsi: ufs: Optimize host lock on transfer requests
 send/compl paths
To: Can Guo <cang@codeaurora.org>
Cc: asutoshd@codeaurora.org, nguyenb@codeaurora.org, hongwus@codeaurora.org,
 linux-scsi@vger.kernel.org, kernel-team@android.com,
 Stanley Chu <stanley.chu@mediatek.com>, Alim Akhtar
 <alim.akhtar@samsung.com>, Avri Altman <avri.altman@wdc.com>,
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
 <c31185f5-e816-937d-25ac-1657b6111ff8@acm.org>
 <464097469b09752ce4ebb38c08f1a94a@codeaurora.org>
From: Bart Van Assche <bvanassche@acm.org>
Message-ID: <8971042b-e300-a1b4-7585-be9e0cf43030@acm.org>
Date: Thu, 1 Jul 2021 08:57:56 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <464097469b09752ce4ebb38c08f1a94a@codeaurora.org>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210701_085803_013079_3331031C 
X-CRM114-Status: GOOD (  10.78  )
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

On 6/28/21 10:41 PM, Can Guo wrote:
> I am waiting for more infos/logs/dumps on Buganizor to look into it.
> With above calltrace snippet, it is hard to figure out what is happening.
> Besides, we've tested this series before go upstream and we didn't
> see such problem.

Hi Can,

Jaegeuk has posted a fix as you may have noticed.

Thanks,

Bart.

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
