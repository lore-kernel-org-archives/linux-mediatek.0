Return-Path: <SRS0=Gsgc=KQ=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9D36FC433ED
	for <linux-mediatek@archiver.kernel.org>; Fri, 21 May 2021 08:07:09 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 236D9611AD
	for <linux-mediatek@archiver.kernel.org>; Fri, 21 May 2021 08:07:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 236D9611AD
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=google.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=blHrTlMayBzpXqvQOV7xiiamlFO2wIRua8DX6wPzS3o=; b=C8xnjNO3K4nKec8Ho+5pGPBgsu
	vrZJ0S/JWSgO0XIQFmZAAy7Kka1HPJHS3VMkM38eGgfyJGEOjrm7c5e0PQ7yQa1l/VFebZqYpKsxS
	gw/IMYA9c6yTu+37YtJAHJZbZtlAAWCRey+wbMi0ntSrvZnU3V5XGEvktaHsrWy1jddYlJSXUtYSN
	PyvyK6437emHCszt3o1Y8ylUBCsiz0Xntxx6BV5CLRofi9W6oT6YuLC2uRSEot4Wx0CLCuR62WF+t
	FsT4OceCdtRmkwZj7RhNaUtsuxRAR02CXUjz0wojZ8Evtdvnayhlmg8PFD9ZUUo8S+Y6zZjFyeV9F
	5PciBu/w==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lk0BI-004Mj2-7t; Fri, 21 May 2021 08:06:52 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lk0B6-004MgQ-M6
 for linux-mediatek@desiato.infradead.org; Fri, 21 May 2021 08:06:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Type:Cc:To:Subject:Message-ID
 :Date:From:In-Reply-To:References:MIME-Version:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=RT+JgsYt45829ZHd2BYc40XqO99OHa9pHrzKSSD5j9A=; b=bGqiDwSjtYKG2IYzQrIMSAEbWf
 VYN69hXjJQnQbo2Jud4r7c8ptBe12LChPty/9yYv8SP0cf2FgeqNTXOh8D/JDo3zJNMXJOwx/bMHr
 I8wv+BXPdoFMaoBiM66qohxLK2ZOxGevbe8JyX8sq286d01hOyM1L9AMlEeieIHuelQRQEbeeIicJ
 SVenrZBDGisFaJ7MDevMNrmtz5Qq9ujhjfPBA8G3oXz8ZUcV8RAr+0QLEk+pH2jXy7mRUVyMAFJ0P
 sham2eDvyB4Yxvsm1IMbLU2Jb/zTicWAZ3eHCCJp4A8VyF009wm0k/9R5hJFJGcorShlrnXiIxFdq
 vVnALwlw==;
Received: from mail-io1-xd32.google.com ([2607:f8b0:4864:20::d32])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lk0B3-00Gvkb-Bz
 for linux-mediatek@lists.infradead.org; Fri, 21 May 2021 08:06:39 +0000
Received: by mail-io1-xd32.google.com with SMTP id e17so6756711iol.7
 for <linux-mediatek@lists.infradead.org>; Fri, 21 May 2021 01:06:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=RT+JgsYt45829ZHd2BYc40XqO99OHa9pHrzKSSD5j9A=;
 b=kLDJ66UxJgXBhTlXqQcr4bzo/A2l5Q8HqghhVGTZn1NhjtsLvIntyyuByjyK72XJiV
 EguZV7WiHzjL9tIOuUpIheqlo/zIR7fCiXRdRsiM9XgCDiG83jwTK8jfkfWII0aiEc+B
 XLW4AK2y3GYblWpuR0WfCpTNh59ZKDqfw+BUVoJ2NPRJ9b+p4M7w32T5SIS0ZEyI8iTF
 uZuzVOQ6hRqrSmIIzBC73CSBQ6vQkLdiJzGnB1y4VMW6hz66G7NvqwOFP97s21DQ5hvw
 VPRizS0txzrgGhqLjoUKanc3unVj53BjOFJS5QE2/1UNWd370D6MHF3o4TDKN7Pdd7uN
 yxAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=RT+JgsYt45829ZHd2BYc40XqO99OHa9pHrzKSSD5j9A=;
 b=E+xKk/hbg+DVM4gXwD7Nwgw2qtwj5USWxVSrWx3a3ru7bBM3AyEbp9FxYlynuita0p
 Qfi5LGIK95b9tIxaH0mKLqalZpFbv2nQnTV6StYNJ7VZfhpVHRmX5jSuHWd5m7FPooKs
 rpIUth8mCYS0rEwl9d6kbd5UQgqQcurdGZhdzlipwWoBkRhE1ymi4iN0ciybu5jf1BTB
 Rs5441UXp9TMpWQlxN9vyMV28fUbDuARiTcyG7whSIgmU6NPnIYm4IebVyAMfXu5vZom
 b4DgbHHAi894YZGtohKhXggA1jVHvHtKlDYrw5j3d3T4gowpH6ifyxuDAlyRLXC779Tl
 L+Aw==
X-Gm-Message-State: AOAM533wLZ9qd5TeL2wTKOML3dIUW57/CcehgkCdJKy55waGEUaXDPMA
 7WLdB0Lv1wJUxAp0eFY/JwzIfYgkxH5bdPtB6A5jsQ==
X-Google-Smtp-Source: ABdhPJzli/TP6ekzSUzbblqRjUcznUEUpI63eE2KDBygtddGTKqTJLATk1eu/Q+8mrD9doz5sb8hrdaLnSgi1Azv0y0=
X-Received: by 2002:a05:6638:3010:: with SMTP id
 r16mr2626171jak.126.1621584396061; 
 Fri, 21 May 2021 01:06:36 -0700 (PDT)
MIME-Version: 1.0
References: <20210521070139.20644-1-irui.wang@mediatek.com>
 <20210521070139.20644-6-irui.wang@mediatek.com>
In-Reply-To: <20210521070139.20644-6-irui.wang@mediatek.com>
From: Tzung-Bi Shih <tzungbi@google.com>
Date: Fri, 21 May 2021 16:06:25 +0800
Message-ID: <CA+Px+wXOKM6y4aHsHTGOiT-VJJ=wzghNDiKSkgaxiefhs+mO3A@mail.gmail.com>
Subject: Re: [PATCH v4,5/6] media: mtk-vcodec: Add MT8192 H264 venc driver
To: Irui Wang <irui.wang@mediatek.com>
Cc: Alexandre Courbot <acourbot@chromium.org>,
 Hans Verkuil <hverkuil-cisco@xs4all.nl>, 
 Tiffany Lin <tiffany.lin@mediatek.com>,
 Andrew-CT Chen <andrew-ct.chen@mediatek.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, Tomasz Figa <tfiga@google.com>, 
 Hsin-Yi Wang <hsinyi@chromium.org>, Maoguang Meng <maoguang.meng@mediatek.com>,
 Longfei Wang <longfei.wang@mediatek.com>, Yong Wu <yong.wu@mediatek.com>, 
 Yunfei Dong <yunfei.dong@mediatek.com>, Fritz Koenig <frkoenig@chromium.org>, 
 Tzung-Bi Shih <tzungbi@chromium.org>, linux-media@vger.kernel.org, 
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, 
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
 "moderated list:ARM/Mediatek SoC support"
 <linux-arm-kernel@lists.infradead.org>, srv_heupstream@mediatek.com, 
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Project_Global_Chrome_Upstream_Group@mediatek.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210521_010637_438222_F9DE52F4 
X-CRM114-Status: UNSURE (   7.74  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Fri, May 21, 2021 at 3:02 PM Irui Wang <irui.wang@mediatek.com> wrote:
>
> Add MT8192 venc driver's compatible and device private data.
>
> Signed-off-by: Irui Wang <irui.wang@mediatek.com>

Reviewed-by: Tzung-Bi Shih <tzungbi@google.com>

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
