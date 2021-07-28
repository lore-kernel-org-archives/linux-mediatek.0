Return-Path: <SRS0=pZ6D=MU=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E5D05C4338F
	for <linux-mediatek@archiver.kernel.org>; Wed, 28 Jul 2021 06:09:37 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B404360FC2
	for <linux-mediatek@archiver.kernel.org>; Wed, 28 Jul 2021 06:09:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org B404360FC2
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=wotIexT9058Gc5rg2vyocx0PvUcMgQNy29I7XX2eM9M=; b=AxRusROTQdkg0A
	NDjMw2LDeFPdMOp3d6tJUiUnt7rQZ2bGeAH7ZYwifP3oScIkcvAPMtLbHcovj6GX/lbBlmefw397v
	5ItBoKoUt79d2r4CXndD8m8VjGfJFzUj8uAzbGruXaCfSaSklX6m7l9STfXx+8wMMZx6B/aR17P20
	10jbsQPsp4x1eEroFOWFb/A+M3Qst9bC5mSdXRebVkr3wjZrYwDjZaoKzHFa1CkLQbB6ljXFoYJn6
	D5ALUJrvYJkdmlEHppZRqzCYf91BS01trfP4A7S5P5GNozWdbbZ81+H4h4HonB31qz1uMe93GhMVo
	6U7TPKfe58eKs27l0Vuw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m8ckw-00HDxn-Fm; Wed, 28 Jul 2021 06:09:26 +0000
Received: from mail-pj1-x1032.google.com ([2607:f8b0:4864:20::1032])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m8ckj-00HDv3-6J
 for linux-mediatek@lists.infradead.org; Wed, 28 Jul 2021 06:09:14 +0000
Received: by mail-pj1-x1032.google.com with SMTP id
 o44-20020a17090a0a2fb0290176ca3e5a2fso2701176pjo.1
 for <linux-mediatek@lists.infradead.org>; Tue, 27 Jul 2021 23:09:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ZqOm8dR3/Z3FMMfb4CCcRYLnM7xQyfTbgeYY457K44I=;
 b=Cr91iegMyQBs958cDlJb4sCpJPeyXEXt4yl4uPRSb4+qmeNpi56ciedzIKFri8UeVw
 CiJMLwHsBhyDJDGWPwEZQHX2gpb+awqkq2ZIsBJfrqO4+8yFXb4LpgX+fnSNQzVjlsa+
 ifMaARxJH67i2DELDi0BAh0b0iAdg4l3DtEXs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ZqOm8dR3/Z3FMMfb4CCcRYLnM7xQyfTbgeYY457K44I=;
 b=Srx1n5MziajbKdI5xpms4hLLp42sghi/TLhQKIdKRXbpcz21OgTtIpWVmVokOnc709
 pJHFJlRDo0smMUb5Arqu25M/oPkFMp1/mA68uRj5YU3hD/Q296GsOtrq3071jds6n8wF
 VYpA/SdUG8FD3oWyDQVGNA7MTyiRynhvXNpmLuVLgcHuwUbFHvvpSKyckEvaXb5QZV+E
 u2Q+SVs0JuHf1hdd7CooTA96jGku2pTAUSIkhvIMwZzL7tZ4y2Im9bON+XVCXl7CjSJG
 18RNnj70oyasMhIS1gLhJ5XPd1qkHsbJtLZBlFnzp9+e+91UZqZ2T0OpPNUq5X4YnxPV
 90OQ==
X-Gm-Message-State: AOAM530im5N6MtB4PLT7kkw9NM3X0zrPVCF8eEnhdVWlKnOvGfi5vK6y
 IqdWi0VVF+TIbsXb1WfHkxgO/1f6zhWSKe0oBv3ZJw==
X-Google-Smtp-Source: ABdhPJxL3dHmMPX1HBiqROlD3Z3DE/tD6dTpa67uwocKIXnMWICioviIBBaG9Oi8aaMGBlkgrVZE/Ta4mUKUmk3Q6sg=
X-Received: by 2002:a62:79c2:0:b029:3a3:8e69:ca97 with SMTP id
 u185-20020a6279c20000b02903a38e69ca97mr3542522pfc.55.1627452551900; Tue, 27
 Jul 2021 23:09:11 -0700 (PDT)
MIME-Version: 1.0
References: <20210727023205.20319-1-chun-jie.chen@mediatek.com>
 <20210727023205.20319-2-chun-jie.chen@mediatek.com>
In-Reply-To: <20210727023205.20319-2-chun-jie.chen@mediatek.com>
From: Ikjoon Jang <ikjn@chromium.org>
Date: Wed, 28 Jul 2021 14:09:01 +0800
Message-ID: <CAATdQgCd710rxipjDNha+d25g744wEPg9Gqc-OamJNnRXpw8aQ@mail.gmail.com>
Subject: Re: [v6 1/2] arm64: dts: mediatek: Add mt8192 clock controllers
To: Chun-Jie Chen <chun-jie.chen@mediatek.com>
Cc: Matthias Brugger <matthias.bgg@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 Nicolas Boichat <drinkcat@chromium.org>, 
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, "moderated list:ARM/Mediatek SoC support"
 <linux-arm-kernel@lists.infradead.org>, 
 open list <linux-kernel@vger.kernel.org>, 
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 srv_heupstream <srv_heupstream@mediatek.com>, 
 Project_Global_Chrome_Upstream_Group
 <Project_Global_Chrome_Upstream_Group@mediatek.com>, 
 Weiyi Lu <weiyi.lu@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210727_230913_268701_910409FC 
X-CRM114-Status: UNSURE (   6.82  )
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

Hi,

On Tue, Jul 27, 2021 at 10:33 AM Chun-Jie Chen
<chun-jie.chen@mediatek.com> wrote:
>
> Add clock controller nodes for SoC mt8192
>
> Signed-off-by: Weiyi Lu <weiyi.lu@mediatek.com>
> Signed-off-by: Chun-Jie Chen <chun-jie.chen@mediatek.com>

Reviewed-by: Ikjoon Jang <ikjn@chromium.org>

(snip)

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
