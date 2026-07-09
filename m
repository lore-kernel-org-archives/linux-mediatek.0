Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 433DAC43458
	for <linux-mediatek@archiver.kernel.org>; Thu,  9 Jul 2026 07:02:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uD6Osf6Z82OsRPDVnF3a4ym/ndZXwELdg64JuzBVz90=; b=gES2Q1oUQH2zYAPTTVBQqewejm
	5dwlbGZyflftGRmjS5scPy5zTFLr/Lkdeg3yB1eOk5zmybm7xoBwQSKQegyK5LdaMijsAKwMIx3jS
	b2SKrTJoBEsIiSSjjghR+y80jV8LPX/HIRtPly4HZtKcy6FWfh0JthAEQkLXzq7Oja9j93RCQ04wc
	fnR0VOzVeRvU4yHIAvXBUeN4orYz9nD9zRsefMsqTWTCv1Yoc+4ZanbFwvlnLSz66yscGdcODSIkP
	Envi04pGzRbZtAyUxbm17FRwpQ8UwheVgBcULYRRP+1PUGT1+ACaAA0OlgfGqTvDPJlX1+eHmo2AW
	ZdmoNMrQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whimJ-00000001ELB-0d8l;
	Thu, 09 Jul 2026 07:02:35 +0000
Received: from mail-yx1-xb136.google.com ([2607:f8b0:4864:20::b136])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whimG-00000001EKI-271D
	for linux-mediatek@lists.infradead.org;
	Thu, 09 Jul 2026 07:02:34 +0000
Received: by mail-yx1-xb136.google.com with SMTP id 956f58d0204a3-664ce3000e6so1496193d50.0
        for <linux-mediatek@lists.infradead.org>; Thu, 09 Jul 2026 00:02:31 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1783580551; cv=none;
        d=google.com; s=arc-20260327;
        b=XphfttVfNT6pJGy4RcJytVaxtVx+YFXh9hWLrGRtri+t6e1z5YUQmKC8svdu9UP56C
         6/uuhcu+LFZ3aHG9NKpgIrpgK56UK+MI4I7RJrfNCeQNtvt2MU/u+NnX/nWHWd6bTPoO
         e9LeoKxVnhVtaWkK8ZfpWBVmk09L06pQS2Hk4miy0RIY3Z2UFlmyoYoAVmog7TyrcomB
         zJjiqITkMyhImSOmQ2dblZUZK4/WcgUvi1jsnft0y4jtXkyi4hwAUfXOST8lGqPBOmCE
         y+TAIno70mWmCD+M2+nTfytWPBJfksl+6394sx1fsYK2tJeq99BXsLrl8YbQmPbX8uf6
         9y9w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=uD6Osf6Z82OsRPDVnF3a4ym/ndZXwELdg64JuzBVz90=;
        fh=2L50Jo8XORsH8Iryf+Uchn/TcMCSB2Euz4mwMP1NkNk=;
        b=rmj25pyZ3MJ6b/LBtKx8MyyKZTicTLwLaec84nLt8IDq7wUOXMt0cLUVwsN4YcQ9KV
         6EgWAtGXmo2TbBvSWRfA9Qo4pLrsnqHtClo63Lzd55TcV79IKmB4KTQqT3mZBOeqdb1W
         wJlvp+W5GqDa587JiNH9kYa/PwOxqkCHBFXQomzGDvQdDEW3QjP7jdmRWuI7rvGKRj5a
         2rfMFTOyf2rRHzIe0JFURfdGtnubkHI2tMwbZvJyVZ2mfoEkV55yCgVjvk9YsMeEIcmX
         h3oWAA/Dwqoap2WQ2q4gf8oXilNuAf2h3j7UYHG+PjdAnpQH+x0KbkDawL3tvaRpnb3F
         BS7w==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1783580551; x=1784185351; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=uD6Osf6Z82OsRPDVnF3a4ym/ndZXwELdg64JuzBVz90=;
        b=N+S55Gfs+A1UnPe+Dj8FIeTfkP68AMPTaNLAMPb62gKzOf5wJXhbshlopHL/ua5dn0
         mULJmFIstEZAqzVXugdYvDvcGEqY9rMp2UCGCwyHY1/baFKFC4E/5zcV8v2fB5h7Gxot
         I44seM/dlP/qVqV1jZTSBoMiIGNMT3qwEYrYs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783580551; x=1784185351;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=uD6Osf6Z82OsRPDVnF3a4ym/ndZXwELdg64JuzBVz90=;
        b=c4lo8tzE2n8TcecaznWFM4nZyrjFet3YTFft40hCGhTGNNSmCy8/t0JEMH90svNfiM
         At0TQFnwI0zGUXH3uusJXopUSdvzYQ7pnyJXz71wa+l1+QazZYvOuZ5jUpmeG53c7LWA
         sW8Xt8T6bpDS6TZle6SFgG7UyblqX69kEZKnn3uslzaMMYbDYfJyyuGlRLcCxw7h+7yi
         mXmWtm+JSGRcLRG/GvZmcagxbtDjmR2NdkCjJDIcf7klfgu8xke9/Ljk86nwVMo8NC8n
         3LbB3Q/fsr/5309lZ77g/+1gWymiev8y0BN8/ZkCon2wiKYaJyCBUCVvuBQvXIhIa4hi
         5wLQ==
X-Forwarded-Encrypted: i=1; AHgh+RqrEPJsHxPsBGACsFnvAYE7lI2EK0b8iXE4xwBWI4WxAiqjQoXi4tJPD7A36Gm1/S4UMxG9PMeOrj/SSyw53g==@lists.infradead.org
X-Gm-Message-State: AOJu0YwTqVNDG+v797FxatM+Bw/h/0jsOHQWacD1cS5BBDy8w24rPCoJ
	L5xN87RpREtgdABkO1AdaEHIU5MJCWk7U/Fn+vphcB16aY1gI7P/1/8/fB0H3g7EWYBPWS96wAF
	jzzNPq+XoCh4AT38h3RLoBLbenupAx04lw8ggs/1Z
X-Gm-Gg: AfdE7cmecJOK7TX8UBhl6D5SCGiCTeouVOa3paFbYyctiG9pjlw2rLk5g7hW3Y0MSgG
	Tp1UjRRLzwVp1/WNJghjXGPfJXGSmfr2QWt9YE9/wnr9iZjNHC2oZA6K6BwICH5HJdBFw5TwjoL
	YRpY7w6yq1qkZH4ZWbUWbvDi4IM7idEQ+h1stCjx5F4G5mIewtgwK6aD5mnSjf9m1mkNDw5DSjg
	jF2A6OOLMfoYhEsWYemnX+MMzcuNBbEJeRpSGVJT3RUdfxTJYSfwHIj44y5whwsHeSYVtLRzYX0
	+ygb+rQavEIJqjS6NTrpyT+glXcl9QBOl9t2eg==
X-Received: by 2002:a53:cf41:0:b0:667:8b91:2436 with SMTP id
 956f58d0204a3-6679f2660e4mr3536586d50.101.1783580550797; Thu, 09 Jul 2026
 00:02:30 -0700 (PDT)
MIME-Version: 1.0
References: <20260709063450.1615041-1-justin.yeh@mediatek.com> <20260709063450.1615041-4-justin.yeh@mediatek.com>
In-Reply-To: <20260709063450.1615041-4-justin.yeh@mediatek.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Thu, 9 Jul 2026 15:02:20 +0800
X-Gm-Features: AVVi8Cc-6951WW98xAGZ6jiAvP0W_Uwp4fM0w9OTetzj576Smn-XC53Uyv0aJbs
Message-ID: <CAGXv+5F3K+xpF8OVJPZgwd7cGJ6oWLZg3Qjh9hgdCop8bCMLEQ@mail.gmail.com>
Subject: Re: [PATCH v5 3/4] pinctrl: mediatek: mt7986: register both platform
 drivers from a single initcall
To: Justin Yeh <justin.yeh@mediatek.com>
Cc: Sean Wang <sean.wang@kernel.org>, Linus Walleij <linusw@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Project_Global_Chrome_Upstream_Group@mediatek.com, 
	linux-mediatek@lists.infradead.org, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260709_000232_932667_BD9A8371 
X-CRM114-Status: GOOD (  12.87  )
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

On Thu, Jul 9, 2026 at 2:35=E2=80=AFPM Justin Yeh <justin.yeh@mediatek.com>=
 wrote:
>
> The MT7986 driver registers two separate platform drivers (mt7986a and
> mt7986b) and used to call arch_initcall() twice, once for each.
>
> This is fine while the driver is built-in, but a single translation unit
> can only provide one module_init(). Since arch_initcall() expands to
> module_init() when built as a module, having two of them would break the
> module build with a redefinition of init_module()/__inittest().
>
> Fold both platform drivers into a single driver array and register them
> from one initcall using platform_register_drivers(), matching the shape o=
f
> the other MediaTek pinctrl SoC drivers. platform_register_drivers() also
> rolls back the first registration if the second one fails.
>
> No functional change for built-in builds; this is a preparatory cleanup
> for enabling module builds.
>
> Signed-off-by: Justin Yeh <justin.yeh@mediatek.com>

Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>

