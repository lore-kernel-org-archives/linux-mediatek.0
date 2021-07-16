Return-Path: <SRS0=t3QX=MI=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 43E52C07E95
	for <linux-mediatek@archiver.kernel.org>; Fri, 16 Jul 2021 06:43:54 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 083E7613EB
	for <linux-mediatek@archiver.kernel.org>; Fri, 16 Jul 2021 06:43:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 083E7613EB
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=nEoX7q8WwV0wTFp/xHSdkfMHZlJDVrP87A/qneXHUYo=; b=Wm3Yk/doZpTQFM
	0K9z+2cK1ciYmNbyMXM1MeoCJBezxJ81dagc70AvwpQ4ATiK+0iHcGvsFMgaRsl2LbB8VcQzql2aY
	bzgb+YatWXg4qNdSB1ZC7lEyQAe7OUEFJFCxzubbORvbc/80qwngji7SXtq1UARPwR3S2S0E6z9lf
	k9beiE4BUdo4HIPqu0TG7zWM9v2+tkZAy+Nvpk7nNsCkIfKu+MWrlRkD0ajzoXc5El1UkFSDrqZjA
	DBzp6UvXPw9TOEZK/RoHAjwwdmI6FxJBFfZzw0TvaGLCzbRW0CXUFj35t1L7RWMvQG6OH1z65CYmu
	bVIj+f5CouDJcv1VD3mQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m4HZX-003PXT-Pt; Fri, 16 Jul 2021 06:43:43 +0000
Received: from mail-io1-xd29.google.com ([2607:f8b0:4864:20::d29])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m4HZD-003PNF-A1
 for linux-mediatek@lists.infradead.org; Fri, 16 Jul 2021 06:43:24 +0000
Received: by mail-io1-xd29.google.com with SMTP id k11so9468629ioa.5
 for <linux-mediatek@lists.infradead.org>; Thu, 15 Jul 2021 23:43:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=IiX28Q2sDYwMuIX/qzaioGu6+VV6GkUw/FQvwDmGtLg=;
 b=YWtD9DoKqHC9Huy4wB+6rfBztqBEV5WfZtLL4wnWQ0wbzaarziMh767CGS3uSPdUtS
 x5f1oBk5WYB67qYDTTH7Ge3qLw5mhhemCAZiPSWw6+XswrNZLtl3EdSJpS1kSD4CTOPk
 pkrhsF4KkSjRigKWWgM/r2wSYZ/3lva+Di1/4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=IiX28Q2sDYwMuIX/qzaioGu6+VV6GkUw/FQvwDmGtLg=;
 b=OY1OH/B54UfyT1KhvQ70c8u9BscBSNX1QBzKWGR7WVI+ZTPvtQPDZyNHCFJ66WWsVv
 Kpjz/tfR/FVcyHyeHS+7hkcVsd5Z9nE+w2Mtj3sicLxiZgWd9KOcIcoGMHPoDamhtVsM
 sFdNzryWjHNhfqa8EMR9VjdhKvkPpHaPcd6j9GHZSPZ5dXidTaikx2WgluxGyps42iLl
 soQukI0VlmEYY6CiDbf7tLBQYCLJERgNLGwe3MlDfBTY33VisF7WcWIQtqVvjewVUbZm
 0XiyBWVTA8GzRPMOYE9BXBMy27NOnlL1D76z/9mfdvtoYmJydp5PAF7rVbtggB/lBj06
 f0/A==
X-Gm-Message-State: AOAM5337ywk3cs+Uji6mYJWFOnNBFwcWLOFgnYJdJzPKNwGDas4nfrof
 wZFhCriQmG+rp3zeHAOlz7CA6rT+99xlge8dXGti5w==
X-Google-Smtp-Source: ABdhPJz5OJ30eGOyvpHpAbWoYXfnr8j0aLyXqTm8PncdRizb0DIL4m7tk7hB8pX2ypGLzNA+i1p5hmQ3mUcggVeWZ/c=
X-Received: by 2002:a05:6602:2d10:: with SMTP id
 c16mr6219649iow.40.1626417801637; 
 Thu, 15 Jul 2021 23:43:21 -0700 (PDT)
MIME-Version: 1.0
References: <1626417143-8015-1-git-send-email-yongqiang.niu@mediatek.com>
 <1626417143-8015-2-git-send-email-yongqiang.niu@mediatek.com>
In-Reply-To: <1626417143-8015-2-git-send-email-yongqiang.niu@mediatek.com>
From: Hsin-Yi Wang <hsinyi@chromium.org>
Date: Fri, 16 Jul 2021 14:42:55 +0800
Message-ID: <CAJMQK-hDH9QGz_FL+gSBhq-+xrzbWn7wgSOqv4QRLY8RfiSHSg@mail.gmail.com>
Subject: Re: [PATCH v3, 1/3] drm/mediatek: Separate aal module
To: Yongqiang Niu <yongqiang.niu@mediatek.com>
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>, Rob Herring <robh+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>,
 Philipp Zabel <p.zabel@pengutronix.de>, 
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>, 
 Jassi Brar <jassisinghbrar@gmail.com>, Fabien Parent <fparent@baylibre.com>, 
 Dennis YC Hsieh <dennis-yc.hsieh@mediatek.com>,
 Devicetree List <devicetree@vger.kernel.org>, 
 "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE"
 <linux-arm-kernel@lists.infradead.org>, 
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 lkml <linux-kernel@vger.kernel.org>, 
 dri-devel <dri-devel@lists.freedesktop.org>, 
 Project_Global_Chrome_Upstream_Group@mediatek.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210715_234323_401185_AEEF9B4F 
X-CRM114-Status: UNSURE (   7.81  )
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

On Fri, Jul 16, 2021 at 2:32 PM Yongqiang Niu
<yongqiang.niu@mediatek.com> wrote:
>
> mt8183 aal has no gamma function
>
> Signed-off-by: Yongqiang Niu <yongqiang.niu@mediatek.com>

Tested-by: Hsin-Yi Wang <hsinyi@chromium.org>

This version fixes the issue in v2.

<snip>

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
