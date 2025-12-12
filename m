Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5DF6CD44149
	for <linux-mediatek@archiver.kernel.org>; Fri, 12 Dec 2025 09:00:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0mw2ckxKrCqrlVWik5CQTkeiXSkBsBd0QUuzrYIPgiQ=; b=T6ZykoL7FQwPS99oHxW+x7i4jj
	pvPoGHdnHfMdITPqBi/qNq/iEPn4EQAMI6RY7faAEvSA5yGOhtijlEEKkC6d+ZlayvhozFucIgV7R
	2F9evdzAr3WiOYpvjoOCOEV45c9rDbO/2h014FxHJxjdzKewXoNbyvYEsLkoJpzZ6gEbN2mc4ciCk
	2EG3q2n8vhC2j7R8rxjDwFKyw8Au5QzfJDpteDev0YMh5Ld+th22nzGYOiJ+KZ9xKEw1Sw0xHiT6i
	kbZuGikVOrU8IvuYlECpfzTuGVNxVu18/1Zy+ng5KgY2hAkHczyGuk52z373ILIRfIsxu1DGqtuXi
	qrZ0IhVw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vTz1C-00000000IOP-46Ff;
	Fri, 12 Dec 2025 09:00:55 +0000
Received: from mail-lf1-x130.google.com ([2a00:1450:4864:20::130])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vTz1A-00000000INY-2MeS
	for linux-mediatek@lists.infradead.org;
	Fri, 12 Dec 2025 09:00:53 +0000
Received: by mail-lf1-x130.google.com with SMTP id 2adb3069b0e04-59583505988so1298887e87.1
        for <linux-mediatek@lists.infradead.org>; Fri, 12 Dec 2025 01:00:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1765530050; x=1766134850; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0mw2ckxKrCqrlVWik5CQTkeiXSkBsBd0QUuzrYIPgiQ=;
        b=TI7qntqamUU5Dzws+aOS0aYvIfjRnobUGaCLri1tJPTQhQ0zrklMCcdsxgqmg3QKpw
         7drUITQVLBR6vuQiZISIDLocm9d97Il4un1MPUeJIx/lw3gGFOCh+TK21gYa3Bi3RhKb
         +axc4VqZDkQ+ijNhifzzQDqLYNoOnbXIASPU29eFkmzjN7ECxRIjC9wVpn3PX/MWrMsl
         tLZluUNJ4bFvEdBSR3N6u19Et+X7Id1juanOt50bEj5myhToKl52yvziUdl4cxg4nUf9
         csWsItGNuMfOq2t+QpNJzk+SjICJMA8pnXVEZk8hb7ftFGMo2tHX3fuOrl2qZGa4SI1I
         nNtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765530050; x=1766134850;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=0mw2ckxKrCqrlVWik5CQTkeiXSkBsBd0QUuzrYIPgiQ=;
        b=adu89yzK/wvuZBe//fsuD5W2YRQPYjeCLbvuJtI/ZJi7ecDOQvP4uRgn576K5XJKT/
         56/T3NRZGz30auo5bvMBja/Nub1KvrRc8+qllhr1LIcC0J/ZY4ukb5waBWecXi5zgH8z
         V146mEsafn1aErHkR9MqCMkxJhzR9uW/9xmzozCoSq1txIisCbAqPcASjSrRruKd2bBj
         hCc7/FnKm8XhrzIhfQ4Cp4wiT3F6BYtdLpUMmGV/LKdaLaJ3uzxSEfFvIJItm/qS96Gw
         LC1L0r8oJOrh8qx8tPgWoH/YfLGPB2I2RBGZO1w+qEcJqEQJpRpnAtOME3uj3lic174Q
         3+Ww==
X-Forwarded-Encrypted: i=1; AJvYcCXBWPbXrPZegHO8y32+23R47CUlKK02foKmD3xMIzkkZ3YnE/i79KaE+n+jL5/QBroc4+lSFaYGXj+Q29zqxg==@lists.infradead.org
X-Gm-Message-State: AOJu0Yzhe7v/WbA9Bjm8t/a968tiCzMQ/68gJk8wcYPWrDs/pTI150OD
	QmWAmgvZkpftZkLkYCDA3b+nEVDTj6r88+eV9JC2wzrmm3VxwXxNd+gOFlfE4xlPYxe8ghnGPOM
	UVL8ES1XMZA0B6BLBd34ja+80LwKa1XNAb5vhl4YEgPBJW1Lgtujb
X-Gm-Gg: AY/fxX6HSvi+KcTnHQJaUuYu7rKTWmD+hSTGY99tdVF12SzIobdjQ7JuI2T1g7BcJQb
	xORFvu8I8FlPTgYMyN4MhE08xHXnmUGkUgmTvbTcf/cUm8OHlfqZH6kRCcYA9IFiLM/2NiORH2K
	0vVZeF7Z6035lPMD3kKJUKk7dhVeqgaGuKl+trUveepELnUhuq82AZYwtXDTvVm0L151sl7k0Xi
	yoOR7zJQK0Ux3Cuw6tb3WcfPJ/Asfyt3RhubNSZxD1UYWhl3j2uO9GMWjaIsTQmhpBCo8TKRkWI
	txsQiSk2onDxA4BVmL49NWaxpOuL
X-Google-Smtp-Source: AGHT+IGHt0jB653fstrXoO4vNaIHzgQTjgWqFmWp/4blz3V3HQcG84keViqz5W7TjXHTBEBk+A9OOWVA1fGP2/OdKUk=
X-Received: by 2002:a05:6512:39ca:b0:598:f392:897 with SMTP id
 2adb3069b0e04-598f3fdf577mr1812272e87.22.1765530048350; Fri, 12 Dec 2025
 01:00:48 -0800 (PST)
MIME-Version: 1.0
References: <20251107141303.223254-1-marco.crivellari@suse.com>
 <7e24110636db36e8c0a877d90d2ed9570c4aecf5.camel@ndufresne.ca>
 <CAAofZF44pUoyDPnnv9UUuMkYvqiSWP4gELg4rutgo=3tNpBZsw@mail.gmail.com> <fd401d1b4f1e7b7178699227d31976453de5891e.camel@ndufresne.ca>
In-Reply-To: <fd401d1b4f1e7b7178699227d31976453de5891e.camel@ndufresne.ca>
From: Marco Crivellari <marco.crivellari@suse.com>
Date: Fri, 12 Dec 2025 10:00:36 +0100
X-Gm-Features: AQt7F2qisoxfgXyJ_Gr6IYtNxxPMB4bbWODY-TGwkyfLroDt6ydW5EY7csE5T24
Message-ID: <CAAofZF45i42hvn9bN=77WzcRmAj8eGXFjY7uA+cmnSLrJUNaLA@mail.gmail.com>
Subject: Re: [PATCH] media: platform: mtk-mdp3: add WQ_PERCPU to
 alloc_workqueue users
To: Nicolas Dufresne <nicolas@ndufresne.ca>
Cc: linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
	Tejun Heo <tj@kernel.org>, Lai Jiangshan <jiangshanlai@gmail.com>, 
	Frederic Weisbecker <frederic@kernel.org>, Sebastian Andrzej Siewior <bigeasy@linutronix.de>, 
	Michal Hocko <mhocko@suse.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251212_010052_600714_8758571D 
X-CRM114-Status: UNSURE (   7.99  )
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

Hi,

On Wed, Dec 10, 2025 at 5:04=E2=80=AFPM Nicolas Dufresne <nicolas@ndufresne=
.ca> wrote:
> I don't have strong opinion, if you think this driver can be ported in on=
e step,
> that is always my preference, and making things explicit is also nice. Bu=
t I'm
> also fine picking this as-is for now. Let me know, your preference, avail=
able
> time and safety of not breaking anything is valid argument to me.

I would like to wait before the conversion in this case, to avoid
breaking the driver.
So I would like to keep WQ_PERCPU instead, like it is now.

Many thanks, and sorry for the late reply.

--=20

Marco Crivellari

L3 Support Engineer

