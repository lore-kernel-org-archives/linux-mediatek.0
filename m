Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2658606A321
	for <linux-mediatek@archiver.kernel.org>; Thu, 26 Nov 2026 13:33:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=M/0RnqMn;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=qs+OWh89
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=uxMVOoteAdKkdMTpKXTn3p7AUX/VbAmvTF8kfIv0P3c=; b=M/0RnqMnBsAWMP
	QmkrQSJdOB5H29WJmLqoSa9vkuk1zROo0Hd8eXTX9lyb2TM1LFglWLoUBp3mswhSYX8xexbV213Wh
	9YgLJytlUjunbvj/IERCtptBjwy8Qi7VyfKm5PP7pysTvq4eRepJa5h06sHq6bzunOKLMNBzT17wp
	igHBWGYMt41UuBZhgtSw/ZGbLhnoFquuEIFUwTTy+8BHihR7prEvyb93XIRaGHVfaaLug+ftYIbc0
	SD7G5N9xtThaIhNCXSDbzgM3uKp8qzCjvh+ziU9R7zHvK9vCGNiVh6zreN4P68xmGaR8JKfakwwMQ
	R2HOkfsBt7YWVUUt2XwQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWZb1-0000000DNfx-2X23;
	Thu, 26 Nov 2026 13:33:07 +0000
Received: from mail-qk1-x735.google.com ([2607:f8b0:4864:20::735])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWZaz-0000000DNec-2XNz
	for linux-mediatek@lists.infradead.org;
	Thu, 26 Nov 2026 13:33:06 +0000
Received: by mail-qk1-x735.google.com with SMTP id af79cd13be357-94961ed97bcso709234485a.1
        for <linux-mediatek@lists.infradead.org>; Thu, 26 Nov 2026 05:33:05 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795699984; cv=none;
        d=google.com; s=arc-20260327;
        b=RBqEWhWMw/0qM9ZN5TVaWmwX1PqZkVRXJ9XDA96pA8pT9rsrdwdbGc2RMGocUaxH5D
         VKZG/WNz8WCAp8x7Wq9xUzrZsf9rlWCqOTT/mOyWPSMeyK+rgPiRoZcrekUul3QWBj0w
         UfJtX+BA3T88+hNRpDfMCYJHs7oR0vimvW1K7tmlzb7vm2+Y3Et559gbI0rJqOq2oANJ
         rziJuBUCABHXlOQzS+PdzHHTMhilNXNWMmo3eA9qYDI7xXVGbzooFn8jBPsjeSEl/R9z
         N7m/usOYjYoZqNqnF8vTip2jqJGJ7GQD+W9X1S4D5fFAw2qxYKozLCw25MQv2xToLulP
         iQQg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=uxMVOoteAdKkdMTpKXTn3p7AUX/VbAmvTF8kfIv0P3c=;
        fh=94TYrtfFscI/1lVmFXlHce7Xoa/gW+YwrYVxPGkFZTk=;
        b=GfAQ3RGpzCjoMfYsTtFVy7WC006PBNMF/axI+KovghJwBjOqHr9NzVs/53J4SnVg6/
         NmLBbPNf8JqdSj9uOzlT3c5jqhJG03nSCU60kTCgS06wK9MuCcYHHDXYsMri1pbN3R2Z
         0DDxLKwQQne+kZ2rSIVbUZWHEbfMLzIM+yXuU/MBcoQfbSsTOn1MBwUJthLRLN1R5hf6
         5naSC8MpQBckx7NqpAoLaISCOwSF58MFfLh3ufDCyi5bPfN4jVYyQKqESismfkcciP0I
         UqOcEy0Wum+0Xt+cRor6zuT+bOR/N4rqwyh5+AH+cchAMMSMeS0Zbf6ctaB1pqnxgpTO
         aKDg==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795699984; x=1796304784; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=uxMVOoteAdKkdMTpKXTn3p7AUX/VbAmvTF8kfIv0P3c=;
        b=qs+OWh89WyaJVUeLTtLJkpCbESyUYv195MKpJgCf3A+0qcu3x1ZYcf3y9hR+T86WO6
         g3Ex0mIb2R/e4p1YHwGh1g3kkm/7ZZHl0CubBP/wHeS6Qp1QZNEfF2jkW1WGs7DcdFlJ
         OepdqyDS5c5I0BTtl4BazXMLYG83bGbj05YJMPPn+IUPkidUCdbBlL1t50587sOV6zZF
         Z+vCrtBw6+lCayeTgF6L45jautNeM/4ldyb1iqFqmPAMnpWJuKfF3Wx12WgUX5LoxPXs
         Yl5nPYg+qYgeOBt2P5XvGc2muvDQgsbNIvaKZorCRoQbHCC17RFsj95xK9BUOCicv76h
         H+Vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795699984; x=1796304784;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=uxMVOoteAdKkdMTpKXTn3p7AUX/VbAmvTF8kfIv0P3c=;
        b=pJ2+olE0tYkHRUlpgassBouPV4Slq7UD4JIMVmO7Q0NsGf0qP9ALWk7pJRg4T5RwUz
         WZgR1VSJK37GBovlikNe62c3ydV4RYCvmGdXCODgd0KfxmdPX/W9Qj488N4T4DzPM9uA
         OPKHWhrYJuK0XVuSRR2vaLm7P1g8nCN8e14e/hTRBBT0fOYG4WJ/od0G16gz2EVm+t0A
         JSiYN63I4fB588OMXGMdkghOChyrO5/Hr7twGagHmlGmvfKb7opzpDRWbxZneGtjanBm
         GzV4u8wGKSatigA2ursP8X8xzUDlaoC4QuhPnLC+xsu/0YL1xoQc/AMpG2QF2ZLcbLja
         UPkA==
X-Forwarded-Encrypted: i=1; AL+hErHjCUHfEQh1S+GoAq7KGnnEY5wpemGo0ZkXgnyE6ho7WK2gPbPlcqbT+MbGrAEEGyPaheAPnSQw33zI5ZA7fg==@lists.infradead.org
X-Gm-Message-State: APuU4Z+1hi6Jnzf2keJfQA+qFR/SUYiJMuscM3BvhafXaqM6QEM5IQI8
	Fuko+mviy6MWXFgqL+rq/TvxtYYaWYdlkGsDrGyx+LiT2VDEX4OUoqcTraSXbsJmzgx2QVpDSWN
	MpSzBrSruoT92BB4ccrs4c82T+TlMB+4bS22NuXA=
X-Gm-Gg: AZFdTZfP7bqpw+jeB3F3XT6VcF7G1xqWvkdKaUnZSBN4DBRivrb8zzE8WqAjy/hADy+
	p8ByfqyfC8gc79UmOLIUcLfhTkHeUsFc9zLObKFEnMxQHFM1cstP7EgaqelocxW8UM7vltfEJPg
	jI2cKPxLoBjOqndhKAnDD0yo1oohdBYgShSIZrM6XGsdFL5dMI54O2+FZpm7csYPZaMfuTG4JFk
	2MnIHUSiC8+/RAYTTVkv+aJnJYBhsbIqcGiS3rhs7zXd8ei6GUG8ivHjDEvPnMJH5nFdpAMpP51
	IA4BhoAahO/GBb2qbJ6ylU5cLkcK+uJeEnIVLsKV+3pbSSQmLTNyiNMDiZolHrPuTs6z5pLzW3/
	ty/dH8ReylIj8xBzZqTxynDIEiQ7a52N65rxdUwR6B0F96FXYRGSJVjd7SM4ztJiGUaTDRuHlim
	w=
X-Received: by 2002:a05:620a:f0f:b0:949:57b4:388b with SMTP id
 af79cd13be357-949bab0eb6cmr4001700485a.41.1795699984091; Thu, 26 Nov 2026
 05:33:04 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261126-a35bb25eb5-u14-0@mail.sdu.edu.cn>
In-Reply-To: <20261126-a35bb25eb5-u14-0@mail.sdu.edu.cn>
From: Akari Tsuyukusa <akkun11.open@gmail.com>
Date: Thu, 26 Nov 2026 22:33:16 +0900
X-Gm-Features: Aa3M54qjjDisuRhSq5dw0ZTix4ZhcjQ6ZVqggl6dEANkCNo2yjka_biV4TPpkKs
Message-ID: <CAKr_iV7eXh5LjQS=66mfGFA5TAX6Ke_cu58eR89G9+vjCuDw3Q@mail.gmail.com>
Subject: Re: [PATCH 0/4] clk: mediatek: Unregister apmixedsys clocks on unbind
To: Guangshuo Li <liguangshuo@mail.sdu.edu.cn>
Cc: angelogioacchino.delregno@collabora.com, sboyd@kernel.org, 
	bmasney+clk@redhat.com, jbrunet+clk@baylibre.com, matthias.bgg@gmail.com, 
	wenst@chromium.org, drinkcat@chromium.org, weiyi.lu@mediatek.com, 
	msp@baylibre.com, fparent@baylibre.com, linux-clk@vger.kernel.org, 
	linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261126_053305_659016_BD528D1E 
X-CRM114-Status: UNSURE (   6.77  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>,
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
X-Spam-Status: No, score=-2.9 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi Guangshuo,

On Thu, Nov 26, 2026 at 5:31=E2=80=AFPM Guangshuo Li
<liguangshuo@mail.sdu.edu.cn> wrote:
>
> Pair apmixedsys clock registration with removal on four MediaTek SoCs.
>
> Guangshuo Li (4):
>   clk: mediatek: mt8167: Unregister apmixedsys clocks on unbind
>   clk: mediatek: mt8183: Unregister apmixedsys clocks on unbind
>   clk: mediatek: mt8365: Unregister apmixedsys clocks on unbind
>   clk: mediatek: mt8516: Unregister apmixedsys clocks on unbind
>
> base-commit: 4dce97c6c265544342e716e62fd24bbb232590c5

As ChenYu mentioned, my previous series fixed these issues.
However, due to my insufficient verification,
some regressions were introduced, so I'm preparing a followup series.
During the correction process, sadly I found and fixing several bugs
in MediaTek CCF, so please wait a few more days...

Best regards,
Akari

