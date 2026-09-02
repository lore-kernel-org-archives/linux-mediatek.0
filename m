Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 44ACDC61DD6
	for <linux-mediatek@archiver.kernel.org>; Wed,  2 Sep 2026 19:40:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MqbOVEuyYxeSD2DntBhPNO5j8MUT5Vkh/1ohb7qF7PQ=; b=FCe5qe5+fRqeIx9Tksu4JG/o19
	COUMnQCIcfNBY98cV8YBQwUzpMn1Q0Yz+OiYl80EhhYoZlB0/WR4MHqfktlx+nQBhdwoVCHw413Mb
	2XQuNxQ8qEeRUtu2sTLnuAO6pJbb932Tk1CP+RoXkOBNtOGhJjv3HRVm138UEjbJRTr+XM3fbyRzi
	5f2mperBxoihMyPtefbyUggh8lLlVdUV5nrQIBX4/rZ+jk8k1y0grL2xj/aY3JlqoCSLYuk4iX2y/
	neCyRmGXQOU1hR5yHTMHiFjrLuDvzZmjn92Yaomx3dLdOJHrUveXZuXg8M8a4YcYBzJPo9mOIJxgY
	+sX3XptQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1qoz-0000000Fku1-3Lxw;
	Wed, 02 Sep 2026 19:40:33 +0000
Received: from mail-ej1-x635.google.com ([2a00:1450:4864:20::635])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1qov-0000000FksS-32eS
	for linux-mediatek@lists.infradead.org;
	Wed, 02 Sep 2026 19:40:32 +0000
Received: by mail-ej1-x635.google.com with SMTP id a640c23a62f3a-c1712a04ddaso243625066b.2
        for <linux-mediatek@lists.infradead.org>; Wed, 02 Sep 2026 12:40:29 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788378028; cv=none;
        d=google.com; s=arc-20260327;
        b=kgzoO4KTKC9q4DTud74brkwT78VdNB7gUbMi8x+zogdqGX7ReyqdovK6TaRegFhIgM
         bNPmzRsVn7cUMaIat693NnIHqM6xJ+7Mx/qgSmq6nOB1zE5d5LzVGE5j61Ulswjl68gk
         /U3SbqugXk+Y/X+1aO0bLhZubtI005oOjsFSU1Pu8xgaSAl1Y4nHpZbGs9autZ2LyXeI
         23lKjzYN7nNEUho8ZqBnKbxfiUPmhU11Lx7dJEiZjSk62lMQ1vw6DpiWyF75tI06K/0k
         mEr360ociFYECI8vjfjlT7KUGpOfnCXliPiqzWYB7xD2JcIxTATz+9t6FlYxwom0g/FC
         FzwA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=MqbOVEuyYxeSD2DntBhPNO5j8MUT5Vkh/1ohb7qF7PQ=;
        fh=Q9jRn6meQMHvSsh7T4E1tICTDCzQuf9dLeiejgxSHus=;
        b=Ho4W7g+tToVqxcrUcp2Ctr3//Cch14TcdTU/P9pYtrw0XuNzHR+bnki0vvreSnvUbF
         0H5ajzftiNVOSu/IHp5yUozKNEBJRYbFbWLhwJx9e1CVtxNAsFKjmW6AVvdAUjDlm92a
         EGV5w55GnNAcDRnGyNagEwgJEEaT90q7rSKEY6TKFY7xiCpPtdj1fhaxXXVNVk/g7Iiz
         GnjD3Pq1Lx+YV2QEG95j2rWhrQbk5+oXL5oDjJxc/y6nxlySlgBS/JmIkVMN7AHz78rG
         xoGmD3uST/5gui8aCWExqmJE+xsfONPJ6HtFvHtgVMgDsnTCCeFATuG8M3zYA42hKO27
         vFvw==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788378028; x=1788982828; darn=lists.infradead.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=MqbOVEuyYxeSD2DntBhPNO5j8MUT5Vkh/1ohb7qF7PQ=;
        b=Gz4vNuEPHHMhnBPKJaBVK5+DB2l+ba3vNgoUzoBhRYZappn5yy8jl8KCyEjwJSE6wj
         7NAKfbZ7e69u/0G/rPcI8HZ8ncBkLpSR0n1FTFc6f9B6xzL+8tBGeGjg9Q5e4igyqVqH
         XOhDbqfkdIf/ddWL/6mr91NQzeoRBW7vvUspkbTXtDHc2cn6SboTTvSxSdkZMdY0i5P3
         HMJoHKAu6WJJ7ZUIe26Zib8hNTIRwMq5N+jyGTcOs4K1rY0liM7C/5bDwYEr51tLZ8K8
         LQD47kCKs02Jx2IZdLA5a/FLcYfGSuc+/CYz2qin2eL94pq89iuKeOmNDcIByE2QM3BM
         rPkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788378028; x=1788982828;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=MqbOVEuyYxeSD2DntBhPNO5j8MUT5Vkh/1ohb7qF7PQ=;
        b=M1zotBPFfSCfaTb51enJ5/2ObR2t2oJoSNOSAKGLEthKjKgP/5OCmqZSWtiIr2AYJb
         yeJ0XYu5sqUnTVD+JWpOkFBJPlOQ7NY8j8sS+rff+AmispcT7fnN1WOFi0sG6BbQ/8oz
         NO4sj47I/G6C6DT2vTumpKDsn8qmqlkix7lbfdNEzYdiJCZsmCyOl0Dwn5+CHAQJOeWL
         GtBS0EKpC8AoGxUwKoMyZ7HVEyLlmmG900WtpKTPJCb5aNTUwjOh660ZrB5xNUrjYfHs
         gy1omGLHxF5W4wyRbAHlewAwm1gOZLfr4AZSgJAEunAE6EphbVpCEvVu1938atHdGntY
         bTCg==
X-Gm-Message-State: AFuF++mCrBAkuYmPDAFIExPidw309VrZAC9RsStVZohhNf8+Ysy5YMER
	XIMSR8lB7T+yBOWWyqiztKuKozfaC3i++4AR44901zS8wlnUhlpO/rJYF8gue3yEQnkIZs3+NQ7
	ikP9HyhLxG4cz0RzJc7galdhpF9ejJog=
X-Gm-Gg: AYBFou0HypRpQFzNRRlmYM4Qq/UY7thSXOMsgYGchAYvG82I/63292rgLPLXzO/bl+Q
	GFH58Cl5MyGkk21y6a+U5owlGALgbf1Z9yAJ83nqaNKmAlh+AHdaXv9+5iE8B/Dz0SvWipNFNDR
	AMSwNUAWQX1Dea+04cp6iWluqCvMPWATDqO7T8jhR/gc+d8CvS3wS7lCN8yhJoqhExMeVBBMdHj
	oS430aJ/E+7KuB00ssV+utj/pw2qeoD7xItqSYERmOMLscuns6DlI/0uPGdgP8SB9H35Ssw2M/2
	+JQegHwjDAS0qYnl2vsV+dcPBj4JxJSreAQ37iMhSKQ=
X-Received: by 2002:a17:906:6a06:b0:c25:88e2:fe25 with SMTP id
 a640c23a62f3a-c25d53cd18bmr358830066b.7.1788378027879; Wed, 02 Sep 2026
 12:40:27 -0700 (PDT)
MIME-Version: 1.0
References: <20260820122242.120039-1-l.scorcia@gmail.com> <20260902154616.GA2133376@google.com>
In-Reply-To: <20260902154616.GA2133376@google.com>
From: Luca Leonardo Scorcia <l.scorcia@gmail.com>
Date: Wed, 2 Sep 2026 21:40:16 +0200
X-Gm-Features: AcwNN1Ue5U8Nrt8IK2CbOEno4dpAA-gcYG8T0qYRXxkQ6nYlNe8G_uXeI7qiNIw
Message-ID: <CAORyz2Kt=rKSJW0Q9pFJiBsa6nPGhHdNrsTsHcE4Qxpq5RsSaA@mail.gmail.com>
Subject: Re: [PATCH RESEND v9 0/9] Add support for MT6392 PMIC
To: Lee Jones <lee@kernel.org>
Cc: linux-mediatek@lists.infradead.org, 
	Dmitry Torokhov <dmitry.torokhov@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Sen Chu <sen.chu@mediatek.com>, 
	Sean Wang <sean.wang@mediatek.com>, Macpaul Lin <macpaul.lin@mediatek.com>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
	Linus Walleij <linusw@kernel.org>, Val Packett <val@packett.cool>, 
	Julien Massot <julien.massot@collabora.com>, Fabien Parent <parent.f@gmail.com>, 
	Akari Tsuyukusa <akkun11.open@gmail.com>, Chen Zhong <chen.zhong@mediatek.com>, 
	linux-input@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org, mfd@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260902_124029_913112_2DBB2CFD 
X-CRM114-Status: GOOD (  10.96  )
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

> What Acks are you waiting on?

Hi, I did not get any Ack for the regulator driver and for the mt6392
dtsi yet (patch #8 and #9).
I just submitted a slightly revised v10 [1] with an improvement to the
main mfd binding, so I think it would be better to "renew" the Ack for
that too.

Thank you!

[1] https://lore.kernel.org/linux-mediatek/20260902193351.185771-1-l.scorcia@gmail.com/T/#t
-- 
Luca Leonardo Scorcia
l.scorcia@gmail.com

