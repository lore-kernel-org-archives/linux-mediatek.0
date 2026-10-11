Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 339D2CA9ECF
	for <linux-mediatek@archiver.kernel.org>; Sun, 11 Oct 2026 22:22:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=wx78Wxn0Vwqymp+y9E4li+EEYQPoZ2jSYNoF4UjZvAY=; b=vEDbfM3pGSZ4RMSavRBC7DvYV1
	vdR9t4iXotYDzl/kDeb/HbfjaPBntWAZ1R+A26SnLScKIiL0LulxwT5TF7ZXBaAqUEdV4K1asm9y1
	LIzNySVDqmghw3OISuSD9hEqWY7x8b6jOWk3aTtomLYzqinp/eszwTGq4l4RipOSH6xB8hVaVOQe9
	VpkFgVJqLm1klxJ5um2CW7B0y7KQLY5/KS2JiTX91Q9TVfl1pPH/ryLu082S/0h9tuBnsojm9Dawx
	kVmpiT/kHSX8N81yNP/aN7xa+42wCHqiodIQyd8O41WbQ31Wv3U83DGboI/M1cTtlNMs45tkGegXr
	p1iqR9vA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xG1wL-00000009SAw-2wr3;
	Sun, 11 Oct 2026 22:22:45 +0000
Received: from mail-qv1-xf2e.google.com ([2607:f8b0:4864:20::f2e])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xG1wH-00000009S9i-2Og9
	for linux-mediatek@lists.infradead.org;
	Sun, 11 Oct 2026 22:22:42 +0000
Received: by mail-qv1-xf2e.google.com with SMTP id 6a1803df08f44-91b52ba422cso18302666d6.2
        for <linux-mediatek@lists.infradead.org>; Sun, 11 Oct 2026 15:22:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791757360; x=1792362160; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wx78Wxn0Vwqymp+y9E4li+EEYQPoZ2jSYNoF4UjZvAY=;
        b=bYHTa2dkSJ1xC+tPhZHspR1nY0w45az8ZLBf1O549krL0ga+dq9mFRmWpJhtN2vRsS
         rJnBG3BJFl9V55p8r9aV9Z//fjG+BIpUD8fFKnNgNI7Ci0b8tuhbOhmIw89hk+tKSodS
         rzIOHBaqB0eNG8azPplrojILY4QXQ2idTFO1TEe8aapr0C+hmbPgMN5n5HTjSxD008yj
         f/r8hs+ED4iTxfQi0LFyOuCCoM4+YB7NwNXgI5rjr3Vc7PHfPI08HPkL0QR+9BCaNvIV
         NG92xLNWwS0WOXVDAIRv2aCXzpD2rvNBRBjVw1XKWWyXFNSpuu0cV9ShqQ+pL+ZnQ6jE
         LjJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791757360; x=1792362160;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=wx78Wxn0Vwqymp+y9E4li+EEYQPoZ2jSYNoF4UjZvAY=;
        b=CzRUBTh4dks/qbeVBkt+5DWH9yMRUOrwyDJI9AR3hXJfrG8UFF9MIn3sWq41rOXzF/
         frCnZNq+NUKupotIXUeKpijRLmkZBebMtEoKkZ5hvm67FC4vXzMYlLSztkxt2jDEiwUy
         bj3GuWuIdkLLjZ0xCZeF92PwkWLpn75UukFVNC3ZFr7PPQMTcxd0P8Z+bIBsQUEWKdlD
         BbObzHZ1sHPk4LFKQfxLmT8Uh7gTqBpE3QnJJgNtJXmYNqscKvRm/nqzQtQmkBMTk6kE
         3zm18Mi1U1Q/+SvNXAFeBH2oxGnOa9ooP5y3cz7dEtOle41K574++UNPnMnPAedBi5mv
         tUeQ==
X-Forwarded-Encrypted: i=1; AKwUvBxCS0S2h262VklfxwEuW8df8SqRMFoO044/xzCU/pulK9wcakCS7mudBHkzv3M87lw3S4cEd5otsABsuvHSpg==@lists.infradead.org
X-Gm-Message-State: AFq9FYLrr/EQ17qrNeTEF5VR3cEzjkoFyRNArXZIgVynpYlCbRcUoO+s
	zwCzvJAPS8ORYbTaSzrB+Jtzn6aRIBSnEpgENQe6rawpo97Oe/4gXqg=
X-Gm-Gg: AYBFou0YTfP+ZjHhl8XZ3+9se24NFIvx6oyknMbvC1MZu8+riRi+D1gNnMe9XhpsBhi
	yqvU0Vuu9yorv22JEZVDr3zQL+qwWiU0VOaaKLjrKGIj7wdozJS6nta5hjZBC56kKYPK/pr6//r
	AReVXObEPWa9u9bWPKLJOuum/Tsuh11+1lxTNwHKYOTlfzTCrvFOt4JfIPh9px8MxyWH9eLNYRf
	Yzob1wfatetcHifhkvJgkwmOeYLwlK9Bsz2VWr9K3+foTwOss1BPfFRoY5/phWRPHXStdZHbwEG
	3yeBjHtn8DuHCOUNBojZFrfgfHar4BypX/E3GVSZQLSkQCJc/r7HjHC6rk4rJ/PUMhNVmxyKJ3f
	/KhIjbUnq1y+VWfrQY1AMW4LzgoSBQNVA1d9Zm5NnGnWSTp55HcS9We9lbbekyqM9ZiwFjuJaIC
	erv1nX81F5PD8mbhGAUtjL0TnFrs5i+vj8mrgfp6H99EY1VKixxVia7ArBOOA3decCyZAfSVYag
	DGSGsu7jhbzi7YUivUasuVnkoElD4KYUGfXUfF8BPfSXJhJ9Qp0peNcRNDK1EqzfmKGx6xUo3AJ
	GodV4lnBH4BTwJe9jH2XABCUTi7fS2wgZ+Qrijs=
X-Received: by 2002:a05:622a:610f:b0:535:52c:a2e7 with SMTP id d75a77b69052e-5359fb8f85fmr135936341cf.44.1791757360176;
        Sun, 11 Oct 2026 15:22:40 -0700 (PDT)
Received: from i4-gl-tmk5904-1.ad.psu.edu ([130.203.156.90])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-5359b7ecccdsm66288831cf.30.2026.10.11.15.22.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 Oct 2026 15:22:38 -0700 (PDT)
From: Myeonghun Pak <mhun512@gmail.com>
To: Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	Ijae Kim <ae878000@gmail.com>
Subject: [PATCH 0/3] ASoC: mediatek: fix AFE IRQ registration and removal ordering
Date: Sun, 11 Oct 2026 18:22:31 -0400
Message-ID: <20261011222234.2098904-1-mhun512@gmail.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261011_152241_614820_46919600 
X-CRM114-Status: UNSURE (   5.02  )
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

The AFE IRQ handlers access regmap and PCM state. Register each handler
after its inputs exist and release it before the final remove callback
or managed component teardown releases those inputs. The mt8186 patch
also balances IRQ wake settings on probe failure and removal.

Compile-tested with Clang 22.1.2, W=1 (arm64).
Base: 238650ef6c7c7cca08e032527329424c9fbd70e5

1. ASoC: mediatek: mt8186: Keep the AFE IRQ within its resource lifetime
2. ASoC: mediatek: mt8189: Keep the AFE IRQ within its resource lifetime
3. ASoC: mediatek: mt8196: Keep the AFE IRQ within its resource lifetime

Assisted-by: LLM

