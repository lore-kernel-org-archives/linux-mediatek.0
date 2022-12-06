Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5C25CC352A1
	for <linux-mediatek@archiver.kernel.org>; Tue,  6 Dec 2022 03:34:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MpTOCNPoOGHImcyJ2epk+VnyvAQlwpT32RE+xjqo+ew=; b=dKI8rGqOJx8VcBQ/b7iktTuIQe
	2eSe9t9SoC5dDjAvA6k/rGBQtCerEhvsS07qUmy6FaC+5q4C8CRElan30i+RVWA0En8V7FBiyf1kc
	wUPplffnTQe/liDdVTWoXz3qplMxdl646LFrdU4psFcZjyZdHSeRV1Bx014GMordSJBPLR7tNOSZb
	wcl2cSWx+7msNyFYyjDCHAtXT1loBYVtyDwdJt2HWnjus8p+tChmiNzOtr8vIHUqNsyeXj73Sdr9u
	BrOGaSSfpb4jMoqkpJ+289F05732H2pzQ/qXT2r1E4bOKV5cl3CIL9N4Uyqc+XijV5cNW1eewFI/K
	hrZGdV5g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p2OiX-00GbG9-65; Tue, 06 Dec 2022 03:34:01 +0000
Received: from mail-lf1-x136.google.com ([2a00:1450:4864:20::136])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p2OiV-00Gb6S-4g
	for linux-mediatek@lists.infradead.org; Tue, 06 Dec 2022 03:34:00 +0000
Received: by mail-lf1-x136.google.com with SMTP id b3so21671822lfv.2
        for <linux-mediatek@lists.infradead.org>; Mon, 05 Dec 2022 19:33:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=MpTOCNPoOGHImcyJ2epk+VnyvAQlwpT32RE+xjqo+ew=;
        b=iGbJ+Vkx4UC1HXpXrfqx1bnICBm9nHpXOT02dS8SU+BhM7NfrjsO5nGsFvhOhelmVO
         tEiqJrga0l7cTv3wIyqgEhjS6C9PYsHdr+V3rqqshutZNCYl3kgFvfBJKXwAeD/rwgQ3
         UQVsPCqdsUYvSqAs13E6fxqhplyTphB4hBcQ/pFmocZ8+6XveOQ2Q3bAcrDswWNVowGg
         yqHcaR1XCps4yPG/J9BtJKyE+5bG4VaRxvAl2hNV1UeCXvHCxtjVC+k1h4rDxuTn74sh
         OMhMpgUgTmE5cKgaNGelTdWf54yjsDIa2TKMNKhdTqbelnpKpudk9+1cSNe8I0gyRh1F
         lsHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MpTOCNPoOGHImcyJ2epk+VnyvAQlwpT32RE+xjqo+ew=;
        b=kFFJLXHMAKCKr3nI+0uIHxFKnW3diAeaDbbbe+ehtGuAvpB/IbVDCXI28TyzkhL2K5
         RjMtZeeBbUul74/aBKoa26+ZyOQPwycyJuOnhgjg6Y1+NBXy4WEFXYHgmvP+lQvBMQfK
         GztE9QjzUS/L6LDoe+Jxo3t1jIz9/5ihNU98PRQvVCegcOB4dM4dQNa6lrEuTRstiiYK
         TBBkrEv8CvzVf0+0H3wbeTOBxkAct0rSfruJGiYwTLRey3rzT6DlbQmzCtR0yYrKEYCX
         u5g58CKlzF3egKf5jYWp3iTaVngixZO1/ZWYSn2MPTJpYeyjii2FQGEIjPcSG9NfeH6E
         lAAw==
X-Gm-Message-State: ANoB5pn1/XK0ZHxCChzSB4CbIlRFMPjLiYhmhHNXpWhkFRpVEVYZe5zS
	/toNISlSCj61SqDXU9xq8Y436LjHcbLo8f1Wig==
X-Google-Smtp-Source: AA0mqf7BGVlmehyMTfuDhKwJMJE/OMgw+2TKeJBCjok2UWENOn/HbvnRAnoEddur3sdaSStyS3TDSLInFdY24rz3x8M=
X-Received: by 2002:a05:6512:104a:b0:4b5:6683:795c with SMTP id
 c10-20020a056512104a00b004b56683795cmr3309502lfb.101.1670297626335; Mon, 05
 Dec 2022 19:33:46 -0800 (PST)
MIME-Version: 1.0
References: <20221206031109.10609-1-peter.wang@mediatek.com>
In-Reply-To: <20221206031109.10609-1-peter.wang@mediatek.com>
From: Stanley Chu <chu.stanley@gmail.com>
Date: Tue, 6 Dec 2022 11:33:34 +0800
Message-ID: <CAGaU9a-e7CkOvQaSHJKR+zYx3YyTnKubS7o_O5SHj-tSqFKyCA@mail.gmail.com>
Subject: Re: [PATCH v4] ufs: core: wlun suspend SSU/enter hibern8 fail recovery
To: peter.wang@mediatek.com
Cc: stanley.chu@mediatek.com, linux-scsi@vger.kernel.org, 
	martin.petersen@oracle.com, avri.altman@wdc.com, alim.akhtar@samsung.com, 
	jejb@linux.ibm.com, wsd_upstream@mediatek.com, 
	linux-mediatek@lists.infradead.org, chun-hung.wu@mediatek.com, 
	alice.chao@mediatek.com, cc.chou@mediatek.com, chaotian.jing@mediatek.com, 
	jiajie.hao@mediatek.com, powen.kao@mediatek.com, qilin.tan@mediatek.com, 
	lin.gui@mediatek.com, tun-yu.yu@mediatek.com, eddie.huang@mediatek.com, 
	naomi.chu@mediatek.com
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221205_193359_199960_6E1B7902 
X-CRM114-Status: UNSURE (   5.89  )
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

On Tue, Dec 6, 2022 at 11:18 AM <peter.wang@mediatek.com> wrote:
>
> From: Peter Wang <peter.wang@mediatek.com>
>
> When SSU/enter hibern8 fail in wlun suspend flow, trigger error
> handler and return busy to break the suspend.
> If not, wlun runtime pm status become error and the consumer will
> stuck in runtime suspend status.
>
> Signed-off-by: Peter Wang <peter.wang@mediatek.com>

Reviewed-by: Stanley Chu <stanley.chu@mediatek.com>

