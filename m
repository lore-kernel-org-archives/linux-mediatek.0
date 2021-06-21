Return-Path: <SRS0=ivGG=LP=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 92D01C48BE5
	for <linux-mediatek@archiver.kernel.org>; Mon, 21 Jun 2021 06:12:22 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5FF1E61040
	for <linux-mediatek@archiver.kernel.org>; Mon, 21 Jun 2021 06:12:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5FF1E61040
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=google.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=NVt1q37Exq8h1pkZojtVQ89GZAw3ZHvSzINvYZ4X8+g=; b=BYjqcyjiMhHjUq
	HQOPk/vRAePz0hy5x82S71Q0p/eU6vBbyUQH/i35bjJbMfhLrPcTdqw17qaBmMB+EStMCcjSuKS7U
	Fpgb2bRmWAIfF/H3XP9bof+EievGj1H23JtFRr6btZOK8kjwLCZodDRfVTIpp+SIN54Ir98gYchk0
	lvvpr1w8bvglnLZZxgLqzvKxSwASNGkwRghlrLofDEykO2HGJhzUSOXnhqFIPEO+ZX0JeJ/OJ1YhJ
	+G3n3xeTxN7lBVDfX/8+jNLrUvb5Xm1eCLp0O9dOtOMKcYhbMVkx0xPs5zas+SgxiJwFANtdSfHej
	sxdce//pkGtP/I7f0FNQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lvDAJ-002Gca-VP; Mon, 21 Jun 2021 06:12:12 +0000
Received: from mail-io1-xd32.google.com ([2607:f8b0:4864:20::d32])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lvD9z-002GW7-1b
 for linux-mediatek@lists.infradead.org; Mon, 21 Jun 2021 06:11:52 +0000
Received: by mail-io1-xd32.google.com with SMTP id k11so1178220ioa.5
 for <linux-mediatek@lists.infradead.org>; Sun, 20 Jun 2021 23:11:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=HSFuzN2SuxKq1n1SNZdRAp1aXuGH5Y42fh3AlSS90EA=;
 b=Sij76q+uTpQ00KvQi7ls8l00DYif5m9lYQuvFuhYdRxR/t/ckl0T+V1q8fPxYN31N1
 dCxKKzW9tyE0Ju//9FlNWgqt4TntnUnlj4qiadt59aMDuDd+qzkFxb2X1nh+AIDNuc1O
 Czq3FPkq5JKyZu9ERdK3CMF7MJMjxmPzjIGBoa3jSuvcTMa2NToJZ5ZENdTJiTE0i0xk
 1hmwfXiNch9Dr5ln0D66nO/YHx/tvBVTorhOn+vIeHU696yh76czqX80s2Jn8NSvLaeb
 NBvom2keZFysmHucYoDBdtVgbx9757nlAKN4ehkpSNBUPPs7OXy3/Sit/twj93KcSjxr
 S3zQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=HSFuzN2SuxKq1n1SNZdRAp1aXuGH5Y42fh3AlSS90EA=;
 b=UaF1YR+V60sZFXH7LJA1d8qKFCeZO/aBTu2bmhfMq3rSJLLk8cy/W8A8LkYLvf7TOA
 QyQo3Rb6LI5bcFXm4+Vt2GM0DwVYLZRFgBHGtPNfXGBM/5/RbPwZcg2DUGzesnwpIOta
 B+NV+9e5tKH3Jdv59PwBIVHHB4/CIK0WCT8hqQsEDOhAwqWKRZQA2g1D6tqJdjLIe+52
 uDeAWsDUnlnP8rCz0299brPGRG9ilKgIYuUzpfmuQ1Wn48bcXjBXwQLX1UkyKBDygJKx
 OR0g3i2OKRAjz5Sp/IOA3V2FMC4J1rkH0U6FHxn9VoKJ1sgOc/UVZMNJ05wbjI+i2GKQ
 Qg7Q==
X-Gm-Message-State: AOAM5331sbnJN88FS12izLwf0yWpkq2Gw9kwL4Hecnjs7vxqFr8gbOel
 8dxSENf7vsAb8AkW/J8plnlNIbyS8SPlw+2dih5cQQ==
X-Google-Smtp-Source: ABdhPJxIwxj31k43j8vYelOlq5U39zPdCtBSaGPst4/RHOpXkrqfSUGGIVE4TyFa8wYehSZFxTcmlKG3sLqNMO6wYCo=
X-Received: by 2002:a05:6638:109:: with SMTP id
 x9mr10662455jao.85.1624255910052; 
 Sun, 20 Jun 2021 23:11:50 -0700 (PDT)
MIME-Version: 1.0
References: <20210620134954.15233-1-Christine.Zhu@mediatek.com>
 <20210620134954.15233-2-Christine.Zhu@mediatek.com>
In-Reply-To: <20210620134954.15233-2-Christine.Zhu@mediatek.com>
From: Tzung-Bi Shih <tzungbi@google.com>
Date: Mon, 21 Jun 2021 14:11:39 +0800
Message-ID: <CA+Px+wVx6hv4ZVFNw_ZodiMrDu30sQkT1Emsk_5MLaPcK_LmHQ@mail.gmail.com>
Subject: Re: [v1,1/3] dt-binding: mt8195: update mtk-wdt document
To: Christine Zhu <christine.zhu@mediatek.com>
Cc: linux@roeck-us.net, robh+dt@kernel.org, wim@linux-watchdog.org, 
 matthias.bgg@gmail.com, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org, 
 seiya.wang@mediatek.com, linux-watchdog@vger.kernel.org, 
 rex-bc.chen@mediatek.com, Project_Global_Chrome_Upstream_Group@mediatek.com, 
 srv_heupstream@mediatek.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210620_231151_201018_38AFF623 
X-CRM114-Status: UNSURE (   5.65  )
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

On Sun, Jun 20, 2021 at 9:50 PM Christine Zhu
<Christine.Zhu@mediatek.com> wrote:
> update mtk-wdt document for MT8195 platform
Please write complete sentences.

> Change-Id: Id18393e8deff2c3492e21c85e97a28e88bc9ca0f
Remove the unneeded tag.

The patch needs other proper prefixes.  For example, "dt-bindings:
mediatek: mt8195:".

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
