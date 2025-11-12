Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 752C3CCF9F8
	for <linux-mediatek@archiver.kernel.org>; Wed, 12 Nov 2025 08:49:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Z99mIqeia+YwnxsvpuycDzk6TGzbqIDr6NWTdL8N780=; b=gSIDePyqWzUM6dngak7u24CL4W
	qtKfUqOxQS+4dubfFjn96q2IeLGA3DeJgohEeS5Vo2VfBT7zAsDLCvpKehZByhe4Ew8LWUHkrJd5Y
	pJr24nGlpEdKPcPV16OvxWFfRMtXWbamsuoQXzDK+v9vEDVngdCg9BeL78v1MOXRhTDuYJyqmJJv1
	JIQkoap+oeyTrzenoXTo1azMjiKFzQ3N9YWvGvzR/WhqPRzeTRlpSk84pGiOjNAPoO98y4X17WiCF
	icEm+HDm/c9YRVpS5Gf+rCtBDzFAjfiLRcpw/M/FNpmjFjSoBam0NQH9eRatF0ReOjL9oNlLyzSWS
	rwCdvr3g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJ6Xw-00000008OMW-0sIm;
	Wed, 12 Nov 2025 08:49:44 +0000
Received: from mail-lf1-x130.google.com ([2a00:1450:4864:20::130])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJ6Xs-00000008OKi-3Lbp
	for linux-mediatek@lists.infradead.org;
	Wed, 12 Nov 2025 08:49:42 +0000
Received: by mail-lf1-x130.google.com with SMTP id 2adb3069b0e04-5942bac322dso554713e87.0
        for <linux-mediatek@lists.infradead.org>; Wed, 12 Nov 2025 00:49:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1762937378; x=1763542178; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Z99mIqeia+YwnxsvpuycDzk6TGzbqIDr6NWTdL8N780=;
        b=EzLa29lC55NB6YdFiwfLcNDBt7WCwSMqMsD+BsZmnIotDum1VuGcpPOd7KWiiCk/AP
         hi6/FwEbCXYVFf+Q0mzcXR+m1+UTI61lw0ht1pHOpsOpIOjMpIPFpTY+m7Gv+q6OoXM8
         08yLnri8uQWnLW1Y8X25RBf6z6RvulQO603to2qliHBj72lIuJCD/f1dfZ66AuXkcF9b
         43DkwW8aFJvx976rJ56QMLD4vmyhog8d04kZzd4WZrCmuJNQj+TDZPC73SXd7swTOHf0
         3LfSqAjoPhCPvMXPHtofl8Mwrk+c0QMyly7U4PpR2zdL4eqTzc0L3WgjZ3Z7ciY5kkjn
         Huww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762937378; x=1763542178;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Z99mIqeia+YwnxsvpuycDzk6TGzbqIDr6NWTdL8N780=;
        b=iujY+a1N4viSYt3PgIdQnUB1v6rZNP37El00agv6SzzcZCVFYVtdfLeFv4L4dQF/Zy
         RaVjaa5qY9chq6zXlBjBQ4uHUA+rGhedBu9m2nvHTdNIYvRpOLaHum9Qat085qQ6FuBu
         Zsqwry1jA2vPdggD62BVOWfOej+LVrlpeD4aGXwJHO1Zg1O2kgD0PncH/lTliN2ZJxFr
         /ZaoWiYNp22udX/+rvee+BB6iVSds0Hp4etGKfWstWXWTT6reCGlsNSULjqizVTsaj+5
         PXhcDrZ9+I3GkDwRlZsxLzvxkzDc+aKADw7ky1M7QOIpK5E96dPqdsWZDhvmYRy4u9Na
         Vi3A==
X-Forwarded-Encrypted: i=1; AJvYcCWz1bRBDAJABcFQd/qM0hq+R2rszc6ovDIaXZErQOHAQxFoFTwdJkWGbsAWJ9DY978MEljpP23HZ1ThfYRfgw==@lists.infradead.org
X-Gm-Message-State: AOJu0Yxf8eZEgvzGRuzN29+pF7AIKhzHWnf1G7YIeRLHJl4rDPD8xX1t
	Z3juK5pE8jELRr8wZryHcjuPWXhgEYYTUFlLyaY+FdDq/ze0aL4JVLHBu9eb8UipGjda29mBWNY
	yONq9BExXD4G1UKnXmBsWK1Ltin6mcU3nk9NA4fTZmg==
X-Gm-Gg: ASbGnct/oZbDAxjBKp+MCRBUzZS+drOyP4dklOhDzqEGKmU4J2jwcRh1ZHzkLFr6Kex
	8iba3EYxTANY+NA2JUTmTReMr5mM3t2ghmX0tJC4Nb//fovViNQ/7k+zqFPMRRO7qnZR/y7Rcv1
	aR4if4ILO4wTflrutglN0lvmZWJxEGn2gWOX+/5EmyrrYRoRxRPj8fzrfzARDHoiCaTRaYqNQsG
	X5QPEMQyg77PzgAfJbUCuqTusFgNOjAyG2x9NhmZDoNCxMLT9VY63hs+gwIBSnyBMk8tDS1W1+6
	md6/h7IfTlyQPTFKDED3fD6S2XMt
X-Google-Smtp-Source: AGHT+IHwkyX27togvHCQMW2BZonFzlk/AX1LRSnafb7ksgAGV7MSuE3/MUECC9rK4STtLAD8hduluRS8ToF2sYh+/Uk=
X-Received: by 2002:a05:6512:a92:b0:594:2b70:6d09 with SMTP id
 2adb3069b0e04-59576e3a932mr714105e87.44.1762937378011; Wed, 12 Nov 2025
 00:49:38 -0800 (PST)
MIME-Version: 1.0
References: <20251105145824.239054-1-marco.crivellari@suse.com> <CAPDyKFpVS9Z86D_QLhjvOYFAbXaa4_Z=ZQnV+x1ZTuXG4x8oXw@mail.gmail.com>
In-Reply-To: <CAPDyKFpVS9Z86D_QLhjvOYFAbXaa4_Z=ZQnV+x1ZTuXG4x8oXw@mail.gmail.com>
From: Marco Crivellari <marco.crivellari@suse.com>
Date: Wed, 12 Nov 2025 09:49:27 +0100
X-Gm-Features: AWmQ_bnT0AamP8qb05zC_dt0cIUnpnjMsIHeflBvyb85nhOL9I5Vg8kBfSa8zH8
Message-ID: <CAAofZF74Ojim5fJmeu2Y3OTqi1VTTTSqLiCf9VGd6XqbXJSq+w@mail.gmail.com>
Subject: Re: [PATCH] mmc: mtk-sd: replace use of system_wq with system_percpu_wq
To: Ulf Hansson <ulf.hansson@linaro.org>
Cc: linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org, linux-mmc@vger.kernel.org, 
	Tejun Heo <tj@kernel.org>, Lai Jiangshan <jiangshanlai@gmail.com>, 
	Frederic Weisbecker <frederic@kernel.org>, Sebastian Andrzej Siewior <bigeasy@linutronix.de>, 
	Michal Hocko <mhocko@suse.com>, Chaotian Jing <chaotian.jing@mediatek.com>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251112_004941_418148_2031EECF 
X-CRM114-Status: UNSURE (   5.84  )
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

On Tue, Nov 11, 2025 at 6:37=E2=80=AFPM Ulf Hansson <ulf.hansson@linaro.org=
> wrote:
> [...]
> Applied for next, thanks!
>

Many thanks!

--=20

Marco Crivellari

L3 Support Engineer, Technology & Product

