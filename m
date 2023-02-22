Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B7794C64EC7
	for <linux-mediatek@archiver.kernel.org>; Wed, 22 Feb 2023 03:17:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zjix5hHmRg1gnpTeSvqiWXkay4LiEwf0MpYeRg42JtU=; b=qSFuMjWCgM60IBxFPcJ+YMvKz8
	mYeJ5+I20q/zBtVMqKPspW/xfDJ3c71k1Rm3Pvh4BMMlW1IDgirNwdcOyCxKZXtMgxvpuVnKMOTHd
	9o8FP+c9myr4kjqHbJHolIO4P2+On96c4wIfT7pckqjAKw6QonKkb5DQhH46UgX1EZhdC+L8JYKhp
	feuUpL6LuQ6/0/XfKNHA40KO8X/3Z8q0taMhLNa7zCCWBcZvzldcBy0UJ1nj+w147kWCHhzgTJ0+Q
	zDWT9U8SLvLqub+N80dD99N6xa2+V3mSt6SptebEJVpB+GxNAoHumx2pWi4P7SorT0iAXAwt4+EDb
	UhdsL6Dw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pUfcx-00AZDQ-Io; Wed, 22 Feb 2023 03:17:07 +0000
Received: from mail-lf1-x134.google.com ([2a00:1450:4864:20::134])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pUfcm-00AZB9-R7; Wed, 22 Feb 2023 03:16:58 +0000
Received: by mail-lf1-x134.google.com with SMTP id x24so8421771lfr.1;
        Tue, 21 Feb 2023 19:16:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=zjix5hHmRg1gnpTeSvqiWXkay4LiEwf0MpYeRg42JtU=;
        b=jsfRdr+kWUxp+JSuWOhyMf2DgmTyC81KmIi94ElAmd4jVlFb1ItgeZ5toC4vejyhFM
         KLDOefgUya0UG3F8aw64bx4lmoMYk1tD8mW2I0HCSputvZkRa4gJltI5ssLQK6Th3HN5
         lphga6gcPXm6v6v4Go7HxAnpnWU+8dGfLt6A8vugqjpCpL570WtyMUfoaENpDyYtW8ya
         tiwzVcEmqSp4CyKiMOVFpgNoGNwnA2BE1o94h3NyyuAg27KkAljAUiYToOILf/KLJAbi
         u4sUXiKPcARYizm++3kiLaGyJA5vTv3Alsa/5bs+tEz/96o3hCiCA8Mz90x81Y8DvbBo
         CnJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zjix5hHmRg1gnpTeSvqiWXkay4LiEwf0MpYeRg42JtU=;
        b=CRWyFsv2osW7xN/njQE7546VrMCq81ybvpu/KAHjNOOoYzf+FsmiRfLVJ0oaEAny4z
         fJSB5FFMV0z7R2Ode6CuM9k0RhA06RMACwxaIr1eDG+6Mh9C/Ke3AcBsWx9HeJhVVEp5
         nFFTSU2iEn8A5r2No3WmCouQecdM4GlvFCKp124n/eog5KkwRkevc2Jcya47O8VR/4oZ
         0nnEJML2kbjovcyjGuqfZRqs3Oa87MshHK9f7/6Y3QpVjQopq5gOVcFNTipKHRhKqfhJ
         hYAC/YG3pYdHpO80NhBuSXg4b9CL31wnawAnSLRbtrqXODbpApEZbmhA/H/56UNcCA4S
         trxA==
X-Gm-Message-State: AO0yUKXPf0srnyD2teJIIRNxCLxAVbeShHi+i1sX8Bt+zvY0nYyzjFKm
	33I7CAFLbI0l54OsDR/wWVHYkEoQWGULuOXHhSZOlX9mUEXk
X-Google-Smtp-Source: AK7set/3OD7E1WKxGGmZLHWOzKUAYuvDvrVESkKv/Ae9by3eSpTZN/UJX08073sf6Ku8mTNdE+Qroaj2UXoEaJwqcSM=
X-Received: by 2002:ac2:53a7:0:b0:4d5:ca32:689b with SMTP id
 j7-20020ac253a7000000b004d5ca32689bmr2302409lfh.0.1677035814323; Tue, 21 Feb
 2023 19:16:54 -0800 (PST)
MIME-Version: 1.0
References: <20230222030427.957-1-powen.kao@mediatek.com> <20230222030427.957-4-powen.kao@mediatek.com>
In-Reply-To: <20230222030427.957-4-powen.kao@mediatek.com>
From: Stanley Chu <chu.stanley@gmail.com>
Date: Wed, 22 Feb 2023 11:16:30 +0800
Message-ID: <CAGaU9a-X5JYKGp-jjKV8MRxoBnD=ffHa3iBshemRikpOHynitQ@mail.gmail.com>
Subject: Re: [PATCH v2 3/7] scsi: ufs: core: Fix mcq nr_hw_queues
To: Po-Wen Kao <powen.kao@mediatek.com>
Cc: linux-scsi@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
	Alim Akhtar <alim.akhtar@samsung.com>, Avri Altman <avri.altman@wdc.com>, 
	Bart Van Assche <bvanassche@acm.org>, "James E.J. Bottomley" <jejb@linux.ibm.com>, 
	"Martin K. Petersen" <martin.petersen@oracle.com>, Matthias Brugger <matthias.bgg@gmail.com>, 
	wsd_upstream@mediatek.com, peter.wang@mediatek.com, stanley.chu@mediatek.com, 
	alice.chao@mediatek.com, naomi.chu@mediatek.com, chun-hung.wu@mediatek.com, 
	cc.chou@mediatek.com, eddie.huang@mediatek.com, mason.zhang@mediatek.com, 
	chaotian.jing@mediatek.com, jiajie.hao@mediatek.com
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230221_191656_894135_6D46DFD1 
X-CRM114-Status: UNSURE (   7.86  )
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

On Wed, Feb 22, 2023 at 11:05 AM Po-Wen Kao <powen.kao@mediatek.com> wrote:
>
> Need to add one to MAXQ to obtain number of hardware queue.
>
> Signed-off-by: Po-Wen Kao <powen.kao@mediatek.com>

Reviewed-by: Stanley Chu <stanley.chu@mediatek.com>

