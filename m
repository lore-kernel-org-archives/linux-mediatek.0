Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2B4C0ECAAD8
	for <linux-mediatek@archiver.kernel.org>; Wed, 14 Sep 2022 12:55:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=o9bsMPChreu51F+DpvXf/8dl+XA0syeIceqw0TCSPRE=; b=KxsYoxDncrKk8TbaLPVYX7IvZT
	6ZDDXRBjSgX7s9CZatxMASbWAH4dnHrqIwhMsbEy2+EPCNRHNdXzM9eIGP2lXQoQx9nqNfrZQOdUA
	2P8ELlHiA/yDAcybkJef0AN4Ks0qj7AFO+V7xsusH1XsTYNT1NqPHC4KUy4t/mvAyHJMZA5QByJYq
	QkHa2zPT5ZKOosP6ZZotvIqTkL+i/LvQUarStTq+FL4TTG4pmlB3/inND4c0AFTlIGcBNI2zkeEKB
	VqMkAkMCE015LB7VPgpEY1Up7DhQIxV9U94w8NVfO0gE1xQT+56REES3ekfLVRdlmeNsTJk8jhXhL
	mY0xAWCA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oYRvQ-000F6d-G2; Wed, 14 Sep 2022 12:55:32 +0000
Received: from mail-ed1-x52b.google.com ([2a00:1450:4864:20::52b])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oYRvC-000Ed1-Gy
	for linux-mediatek@lists.infradead.org; Wed, 14 Sep 2022 12:55:19 +0000
Received: by mail-ed1-x52b.google.com with SMTP id e17so22112589edc.5
        for <linux-mediatek@lists.infradead.org>; Wed, 14 Sep 2022 05:55:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date;
        bh=o9bsMPChreu51F+DpvXf/8dl+XA0syeIceqw0TCSPRE=;
        b=iVCIe/V6cngaoT3RK5U1+Szzb05njaWIlPKBzXipO+DpKseYlL8EBxX/sfllpNyiy2
         qW75G4OIsnrjGS3EtmE847+Wa/ZFk/TSm+OEk71U6bf+K2n1MeAnWV+X6D4o4YkNd1UT
         2VyPqm3RitaCWi1ZOBBWNUM4JlN84zYlP9PquZ0+b9OVi8dOOwHAxL+HtQ9XnnvJoFJ+
         rlt5g5bHUQTyiI6qDYyIW9KzHaxN3HC9Jy1X3O48RXbfMkjy4Hw1rJJpO21f8ghbD2Ez
         Pg4569RDUJ7qGLnc9rjbX1mXeq4sCy+p1qE10H5LXbU8bPYB5gEn+9CT1zkX6zikTKoV
         XWeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=o9bsMPChreu51F+DpvXf/8dl+XA0syeIceqw0TCSPRE=;
        b=f2o2sUYPgA8dVXBMyjt/av+viGPeF5Z3/2UUtorI+OsUuKSl0X/pqEEQjxlUfIa4h/
         qIDNeA1XwA4rnyWS9btQvlNLEARP257Cvdaz1TLWJBP00Ms5hpQdgYndQ8fQdwBlQhdQ
         ek8165vUhG1eVd9lrYwAA+EbFTS3oGrLqBSclnMbRzIxZdtm+BoGcxN61KweRxBT2BNe
         LzbpbUajV97BXdZZwEsxGShAFcsSdba5UtGH8hmNhPw+fkfLp2iQSAne8NzIFSRoOVms
         OI80jT+hTiJ/ZJWXQ5fhU0g09HLbcRwKL/isjubJMoTaTxChIakJWaChNE40yFt+jSnM
         JZuA==
X-Gm-Message-State: ACgBeo2PDrBjVeZD3fmhy6hvyD06HcvPU+YLBpDefg6nD3J/i5h+NTJT
	Vi4XJ+SLnw9p3RoPzzwobQLcnZl19QaHHF7TY9lKnw==
X-Google-Smtp-Source: AA6agR6kZD9JXsB4SrCbxYC3E8ILxvnVxqjQ3570ruXYKWkhtbdMpwIGhCypPfHA5kXBOpAXuDD6YMeLm/q1TYaqHI8=
X-Received: by 2002:aa7:d6d9:0:b0:44d:e1b7:d905 with SMTP id
 x25-20020aa7d6d9000000b0044de1b7d905mr30553355edr.32.1663160116189; Wed, 14
 Sep 2022 05:55:16 -0700 (PDT)
MIME-Version: 1.0
References: <20220912092440.21011-1-chui-hao.chiu@mediatek.com>
In-Reply-To: <20220912092440.21011-1-chui-hao.chiu@mediatek.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 14 Sep 2022 14:55:04 +0200
Message-ID: <CACRpkdYgAv_XM6-b8mQMT0xB76JgwgxriEVwPj=9cHyLVJVUiQ@mail.gmail.com>
Subject: Re: [PATCH v2] dt-bindings: pinctrl: update bindings for MT7986 SoC
To: Peter Chiu <chui-hao.chiu@mediatek.com>
Cc: Rob Herring <robh+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
	Sean Wang <sean.wang@kernel.org>, linux-gpio@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Ryder Lee <ryder.Lee@mediatek.com>, Evelyn Tsai <evelyn.tsai@mediatek.com>, 
	Sam Shih <sam.shih@mediatek.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220914_055518_592400_1222EB6B 
X-CRM114-Status: UNSURE (   7.61  )
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

On Mon, Sep 12, 2022 at 11:25 AM Peter Chiu <chui-hao.chiu@mediatek.com> wrote:

> Add wifi pins in the description and set 'maxItems' for groups and pins.
>
> Reviewed-by: Sam Shih <sam.shih@mediatek.com>
> Signed-off-by: Peter Chiu <chui-hao.chiu@mediatek.com>

Patch applied.

Yours,
Linus Walleij

