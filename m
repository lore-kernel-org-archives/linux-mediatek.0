Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B76EEC43458
	for <linux-mediatek@archiver.kernel.org>; Tue, 30 Jun 2026 13:51:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6lTkuJtbThV57Tf5WWEoPXOogHAi7+jN4q+aTmy7jjI=; b=zMewPFYmfRLgFE9FbxgSON8UAx
	ERRZSwIoDdY/b4Zbyg7UP9159+bxOXld7KOhPUtSolofaLhF3xKDtGjO/zkbVYyif/azqeQiQZoIJ
	u4jI03yqkvFnU5Y//vVVW1V2yGXKhfTlcz5Cbds0fvAzQ2bNnZRjbFQYHAMBq121bGyryKppZ6+a1
	d9EXXgstaytEtzfRMvt7frhAJ9QObhQV2mCS/3VhyD+aR2wEn6Ic0IY9ZEJnTmfgMOywIdXOLUByL
	jvOcV8YddI+dj6H/XnvOd8JYqNGSlgzdzZPh0I72+yJhRtZHhius9fLcX9A7KP9KFaaFSiem3ocxe
	+eZuat8w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weYrj-0000000HDDK-2zqt;
	Tue, 30 Jun 2026 13:51:07 +0000
Received: from mail-pl1-x632.google.com ([2607:f8b0:4864:20::632])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weYrh-0000000HDCY-2AUD
	for linux-mediatek@lists.infradead.org;
	Tue, 30 Jun 2026 13:51:06 +0000
Received: by mail-pl1-x632.google.com with SMTP id d9443c01a7336-2c81d799ef2so22694795ad.3
        for <linux-mediatek@lists.infradead.org>; Tue, 30 Jun 2026 06:51:05 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1782827465; cv=none;
        d=google.com; s=arc-20260327;
        b=k+jQSl1fROl7BqQifjyrrlsRATi8BpABNSXkEgh7AsxHUVXj2Gp7mf6I6SL9kKCtHb
         hcekf4d8qB6l8cCUCUPX8uK/KKZyJ+EHqekdEUkcfC/RAenV7KZUt2D3yKQYwF8CfJeF
         zaJazpPmaFsP6puKWiJImzM6eTLG/E8OkOa5tAEE5Pp4E92exXBg0FhZ5tMOCABsDnec
         Om0B3ou1mh9iNPY1NlMdcRJ2EO6kWw+sOX4v9Pt19ibzeypIv5IbavlZxb+dWfCS0Bl4
         F7bc/LFO6K1dJ3G/VD7+DR0k8GlAH3DV0LTPrbNprQ61I1hxvkBuPTMsBSGfd0XqrF1O
         vR9w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=6lTkuJtbThV57Tf5WWEoPXOogHAi7+jN4q+aTmy7jjI=;
        fh=qi7PCXtswcCAheB0W4PkfNdmw2fqrxVxyEzKQkDvhN0=;
        b=Ofnk1JLixoxw0fPZKXVh/x+oyU+e36IG0+KJtSJidvDd2qIWB8Uw/79sdjJDCPNc3J
         Kl2R2XNjleiCbNqZVgIzySYo9uAcslPCEL5HbaYqJ/q14oq5U3a6kScG3ALW9Zs5MGnZ
         6LDAkU/Nj9p+QTCkeO+7SZGslnEa456Tyg/jQq3beKpfz5rDE9FqX964WtByPNloHPS5
         mLqT/n2aiDzSFExGLHbNyYyWXNhHZefDyr5P5qGnuAIllM72BRTcbCSTndQ52rp8/SZb
         OFRitCOiP4Y+UuDFe3rM6qPwP4Bvo8BSJHEOmxfhDevElgfmWkZU+EkB+C+H1cLkBxtm
         OiQQ==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782827465; x=1783432265; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6lTkuJtbThV57Tf5WWEoPXOogHAi7+jN4q+aTmy7jjI=;
        b=DJtAoLt27ujmP8HhvpWWDlgPHhV1dp8Xh9HJ0GW7wMKhIpZo8KobCNCUfCF0b0j7Lx
         1s8/K4U32ektm3VzcGSWvOK2bgW+nAwpWDsFVnHkD5JfRw8XkLqvmuMDKSlkExzwpZSK
         ehdC/qXwO6P5Cpvx2Cxs45Yzlh6OwyoLlU3ueYp+ad/3yILFqJRvmVJ0+1ZKwqwHtSwy
         HHHVPRJonRTOdSjoEsYfXCVjU8GW05cWaoI5oXRDurUJgDxZ0ysI/EQR3cB8gjRwQXGO
         8ePdqAyVQBaRdrPbg1icpjS8bLZYUH+4PPUx0/E+FfSfVns4stBybQhIOveUwXtNv1hN
         zl8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782827465; x=1783432265;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=6lTkuJtbThV57Tf5WWEoPXOogHAi7+jN4q+aTmy7jjI=;
        b=Md/yReNG5bATJ1Enz41HMH1Yzdo/ru42Q9rh49EweH9FCiZoXkVfIqekaUd+eBFMsT
         oG0aL6EzVQq+fAqwCCcL0erlsFhqXKUbs2YrQoGBFO/452bN0DyDloJppvO66Sdtg4GS
         AdS7ZUAxf8EVLaOKrqOm4f5ewxgRwT5BjJd4c+51fV1/hpJhapoJLSdzt8ktkcqGjq5C
         EpgF7gYbkV6Bl3++917/O3eFqVwg7v4t18IxOGz3BOsSb7UUNETu/YCN7+Ryt+gRjSrn
         KyyUZxIPVrXAeC1KNrEqnN/rC59I53QdTrGdDShQ39MJs2uLOfElRuSXdCiQtaLH4aKg
         OggQ==
X-Forwarded-Encrypted: i=1; AHgh+Rpy1fH7foNeFMMqBH6+BMgOpFiOiHzB3vpyNAk7+Sfw6tNgmLBwo6JyvhJGC6BdLwA62kO7dWq/vavQk53PNg==@lists.infradead.org
X-Gm-Message-State: AOJu0Yw9DAVD9j6pBj0gVFNu+vLZ2fHTjrVhYWqBy2JCG/SfrtqWufBJ
	ifykqxKX2M00SBJGpg48ejsecFLhNzueGS8q9znJIdZrQHM3JzE5i8XcoXzzeIa/HgJ64tHikpS
	ioUy+YvaV3LTvvMZCK4vNnjI/7Cm3wp0=
X-Gm-Gg: AfdE7cla6+ZLaqVWYvUjZy8AUlDwKyXE5ik6Q5sIRHfT6LnULu7ArFyu6oWr41KnHn5
	fncvCapFQZt5n5KtdUayn4Iyc9yVIfMBut5GfEBKX3rInWsH3433Mawe3MT1YVVTxhXzPRyQeb5
	a3Z4jYTHio4h/KwJusSHoGndgvShdyfCLP/6BiWOGrcDGOpQHq1ie3fGDIDqbZZ136soTwZin76
	CNrqmBQv2OiWNLVvnX2HmaMKDhmyK4zeonjSdMygGXbf+sXzeIVCPnF1iSOagfvrMN/t+2QGahv
	HqxVlWjI3zPvDxfSeEvaXl3IY3grOclPRZJ/zEXjY7UuV4i0ZvKl9BCOvXsIVw==
X-Received: by 2002:a17:902:e947:b0:2c9:c517:d078 with SMTP id
 d9443c01a7336-2ca2ea32743mr30876155ad.36.1782827464698; Tue, 30 Jun 2026
 06:51:04 -0700 (PDT)
MIME-Version: 1.0
References: <20260630063449.503996-1-phucduc.bui@gmail.com>
 <20260630063449.503996-10-phucduc.bui@gmail.com> <20260630092821.650c30ec@bootlin.com>
 <CAABR9nG5Wo1Wb+2_T6dR+6XTw8Vs9awSpQrSZ+k6=jp_ogoGCw@mail.gmail.com> <f5ab965a-9640-4df0-8108-7877f34b6950@sirena.org.uk>
In-Reply-To: <f5ab965a-9640-4df0-8108-7877f34b6950@sirena.org.uk>
From: Bui Duc Phuc <phucduc.bui@gmail.com>
Date: Tue, 30 Jun 2026 20:50:53 +0700
X-Gm-Features: AVVi8Cc6YVwHmJJJBcmL6xlBLsZj8Ul3JarMT_3ATDvT8NUt9u8sy29ELCp0KAM
Message-ID: <CAABR9nGGTRTWTSDmzZ4OcXmQ1zmWgnm8yPN5vM1DFLyn=AgwOA@mail.gmail.com>
Subject: Re: [PATCH 09/27] ASoC: codecs: idt821034: Use guard() for mutex locks
To: Mark Brown <broonie@kernel.org>
Cc: Herve Codina <herve.codina@bootlin.com>, Takashi Iwai <tiwai@suse.com>, 
	Nick Li <nick.li@foursemi.com>, Support Opensource <support.opensource@diasemi.com>, 
	Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>, 
	Srinivas Kandagatla <srini@kernel.org>, Charles Keepax <ckeepax@opensource.cirrus.com>, 
	Richard Fitzgerald <rf@opensource.cirrus.com>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Shenghao Ding <shenghao-ding@ti.com>, Kevin Lu <kevin-lu@ti.com>, Baojun Xu <baojun.xu@ti.com>, 
	Sen Wang <sen@ti.com>, Oder Chiou <oder_chiou@realtek.com>, Linus Walleij <linusw@kernel.org>, 
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, u.kleine-koenig@baylibre.com, 
	Zhang Yi <zhangyi@everest-semi.com>, Marco Crivellari <marco.crivellari@suse.com>, 
	Kees Cook <kees@kernel.org>, HyeongJun An <sammiee5311@gmail.com>, Arnd Bergmann <arnd@arndb.de>, 
	Qianfeng Rong <rongqianfeng@vivo.com>, linux-sound@vger.kernel.org, 
	linux-kernel@vger.kernel.org, patches@opensource.cirrus.com, 
	linux-mediatek@lists.infradead.org, linux-arm-msm@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260630_065105_554541_37AF33A5 
X-CRM114-Status: UNSURE (   8.58  )
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

On Tue, Jun 30, 2026 at 8:29=E2=80=AFPM Mark Brown <broonie@kernel.org> wro=
te:
> Please delete unneeded context from mails when replying.  Doing this
> makes it much easier to find your reply in the message, helping ensure
> it won't be missed by people scrolling through the irrelevant quoted
> material.

Got it. I'll make sure to trim the unneeded context in my future replies.
Thanks for the reminder!

Best regards,
Phuc

