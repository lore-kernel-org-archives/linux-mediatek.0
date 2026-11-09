Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3EBE4606A323
	for <linux-mediatek@archiver.kernel.org>; Mon,  9 Nov 2026 05:41:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=plAVflP3;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=htpCSwap
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=TrI0GbzOqH9Y+vNRVIA18oJVEvnOoZMEzsKGzGyq4VY=; b=plAVflP358oG4t
	Z1hrPGdph0JGrZoINx5uOLoau3QfouOtsIoN6qsMZa10982gywg6JPjHecPRHsaFzpH8qQSPtt9d0
	uzjTXrG6LMmXKuUMG2il36U22/KsbTEmEzExK42/5loKvRCASeqfl4U2z8e5JLkGLLBmIwMtfIo92
	RDxO99K5DbM1YdAtao+LvZjUB3YSXeJcM+FYYnNt3ydkBm9l9ztSmyhshk5uYtyZ3rF62BHM9gBhp
	LkzXq2wiFYGBLco69vl3TNSX4m5oD3wGinEdVwwl71Ai4jW3JyMtZw0YABiQSMaUiengfAA4afh8F
	fL4Qf4FNGQOtW+uj6R9g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQI8R-0000000HRHK-3KWq;
	Mon, 09 Nov 2026 05:41:39 +0000
Received: from mail-yx1-xb12b.google.com ([2607:f8b0:4864:20::b12b])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQI8N-0000000HRGN-0oZb
	for linux-mediatek@lists.infradead.org;
	Mon, 09 Nov 2026 05:41:38 +0000
Received: by mail-yx1-xb12b.google.com with SMTP id 956f58d0204a3-679334baa1fso540012d50.2
        for <linux-mediatek@lists.infradead.org>; Sun, 08 Nov 2026 21:41:34 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794202893; cv=none;
        d=google.com; s=arc-20260327;
        b=WfSrLkSVJF0HeoJTvH+bIOfugOZMODeo25ThQAPWJcnDMp46LT6JMVGFoiTPD6VKUl
         lebS9ND8aO3hWQRMNrSP78wxFl6zgDvbQfXgailKpKV56TXzP0f41h/jVbYMsU2+xCTV
         OK1VxuBnheVh+T3WlDwCQUAxZQxNHBFD7Rx2d6VWDuFRrVBr3wgRPGMdUQiaNRSr3dXW
         mvavMa13D/tucz50fmBiWZzT1FvCrUKODoKjGZ5KgGePT+11li9fa2uKxSTfQBKgafp1
         VRfC9fPDvFnl/3PKAgzqH8ebYojNkfbgVt9/GGW0OdXyuQVNc9bzP/ws9vqGcKVJARfU
         lhHA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=TrI0GbzOqH9Y+vNRVIA18oJVEvnOoZMEzsKGzGyq4VY=;
        fh=KVFtYzWzm2XtJySLaokvQ7ld3eCayuTxdcLbvdNGKmE=;
        b=jaI8UP93PmONZX9kBQ9EFce9GAduR8SSzXUBML2nJqVWLHcE+IAYqgE3VZbFtwzme4
         oZNglihkw1o/s+ODOfAnlJXzvHdodKeevgLVSjfah7l8MEiu/CRofcb57+M3Wk9EDNqy
         gCha178m9vj486d+A5SJezXYv8XC+17mzSRjIdzs1BW5IjDZBYX27MVut9ZkocXWoFdQ
         MYRqD9y8WhQ4+ascsw6poQM1ivCh+bh/GaScwSgUiPUNDzDj+7uW1HddCgkAVd0nG7ea
         3FL+mT3774KTDTfDfCGcwCUgvznknuzBlNo16jr6PdxBF54IRksZG2imiuPxo0QTDnS1
         /Lsg==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1794202893; x=1794807693; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=TrI0GbzOqH9Y+vNRVIA18oJVEvnOoZMEzsKGzGyq4VY=;
        b=htpCSwapp/PXyOaPbq+C84EgnWPujfG6AuTJSM3BxqBimiiaLv/P/a9cmdTCa4GC/L
         iKwieMzisl6xZ+dE8+r9yXS+OMvW4xZGH1+ERVNYDlV8LBy4h2CHJOOfNojg/5vCSGYn
         cNXW7x2S4r07IsmpTV0pBojPhOok7p5nEiPIg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794202893; x=1794807693;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=TrI0GbzOqH9Y+vNRVIA18oJVEvnOoZMEzsKGzGyq4VY=;
        b=0vi38eZVzE87dnGFnv23eu+9MQaBOmXSYubJVV32a1wEOUlhL+C/EUN4hCWj2g1UHN
         fGOgcRv7g42uGlagjqFTL/hHRKibk5rlnVad9+YA/E53RY9ewFuU1sIVI2NKEChzSGlI
         Xo3NX9JCpBPufrJ+vEcu0rtAyQh/iNCha5x78FhFgyygjxNBQsiQu/koNTRx6WoW27q6
         Fa/ZU6pSL0/hBJ4Q/ZKPoOanz5eTTfTGLOq8a7R78S4xdnNUyrIDnVhHkRoUBDL4CEKK
         pGHZ62/VunxP5KGWUal8LegNcGwaAsai60Lv33SYtT/5TxYNxTeDkpAvgMYMpaRqyxB8
         My6w==
X-Forwarded-Encrypted: i=1; AL+hErGhzCxG8IzkbvhFNs50Lu/3uFMui+4wruZVJW5rN4XW6TM6yiOlwGgd00jASVoscx7wyRxPefg9MWk+xwaScw==@lists.infradead.org
X-Gm-Message-State: APuU4Z9KbysITMlpqZbtHrUvFyRniS3f8UMrjeXvrfsO9crRvN9E+BQO
	upY+iGEIFE3ddTAK1Y2Uu2suzu5RtcXdKHXD/IJNmMRzVBq9tkR77nXK+rnr5mANV7iG3UxcZFr
	7FLO9h5a9GTDUWw9dnnPdEvHuY2TB99VJ9eb0rIsr
X-Gm-Gg: AYBFou2I7eBMWorD50W/tmxztVaLKUZnrwM6OYtbhl+r790XXkGeDXTL5Ec1uf6/jsF
	S0byb3/eUvvSYOba+WKNXPqpLTq1Ad15CSXAqKmLN6iwjt0KSECTMndbSGZZQ/amFgn0ll5PsbM
	23jCV8yVvgffmKP+xnjQMC87hjeRITvWsOuED1zm8tq/lszfpqoF13xguz7sbOj58Y7dQiwL9m6
	qfTdwvFsretcPYBlYa2MJREKVbrnPI58HHwetnZYiTdHcWvdK2koS4DTBS++1yspMTaqOUtmCSc
	UvsM0Wn7S01aoCIR08J/MyCxZL7pgHbdPkb47AUkEjz9VkfHhhz1ybd4aZNDZJadk8Qt4oqHaVS
	U6Jcqak9M3eAYbdqcYpLDNuZLN8yGefkkJdmWTg==
X-Received: by 2002:a05:690e:4393:b0:67c:10d:e377 with SMTP id
 956f58d0204a3-67c3d97b42cmr874807d50.24.1794202892850; Sun, 08 Nov 2026
 21:41:32 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261103043734.2179858-1-wenst@chromium.org> <179406980914.3424803.6201831446824678583.b4-ty@b4>
In-Reply-To: <179406980914.3424803.6201831446824678583.b4-ty@b4>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Mon, 9 Nov 2026 14:41:21 +0900
X-Gm-Features: AclHuK9Uis4PjHZvlrrahSmg0-iKCJazl9kKs9oybOBLW0q8BipFSNFJ0jiQ-bQ
Message-ID: <CAGXv+5G1SozUuj8v64oD07wz6dFbY+bXh-Q3OVvieY7v41ZJ8A@mail.gmail.com>
Subject: Re: (subset) [PATCH v7 0/8] arm64: mediatek: Chromebook trackpad
 supply fixes
To: Mark Brown <broonie@kernel.org>
Cc: Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Dmitry Torokhov <dmitry.torokhov@gmail.com>, Jiri Kosina <jikos@kernel.org>, 
	Andi Shyti <andi.shyti@kernel.org>, Benson Leung <bleung@chromium.org>, 
	Tzung-Bi Shih <tzungbi@kernel.org>, linux-mediatek@lists.infradead.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	chrome-platform@lists.linux.dev, linux-input@vger.kernel.org, 
	linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261108_214135_300998_52EFD5DA 
X-CRM114-Status: GOOD (  20.38  )
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
X-Spam-Status: No, score=-10.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Sun, Nov 8, 2026 at 7:25=E2=80=AFPM Mark Brown <broonie@kernel.org> wrot=
e:
>
> On Tue, 03 Nov 2026 12:37:24 +0800, Chen-Yu Tsai wrote:
> > arm64: mediatek: Chromebook trackpad supply fixes
> >
> > Hi everyone,
> >
> > This is v7 of my Chromebook trackpad supply fixes and optimization
> > series.
> >
> > [...]
>
> Applied to
>
>    https://git.kernel.org/pub/scm/linux/kernel/git/broonie/regulator.git =
for-7.5
>
> Thanks!
>
> [1/8] regulator: core: Add "enable and wait" functions
>       https://git.kernel.org/broonie/regulator/c/9f9bcca6adc3

Thanks! Though I was wondering if we could get an immutable branch
or tag for the commit, as three other patches for separate subsystems
use the new function.


Thanks
ChenYu

> All being well this means that it will be integrated into the linux-next
> tree (usually sometime in the next 24 hours) and sent to Linus during
> the next merge window (or sooner if it is a bug fix), however if
> problems are discovered then the patch may be dropped or reverted.
>
> You may get further e-mails resulting from automated or manual testing
> and review of the tree, please engage with people reporting problems and
> send followup patches addressing any issues that are reported if needed.
>
> If any updates are required or you are submitting further changes they
> should be sent as incremental updates against current git, existing
> patches will not be replaced.
>
> Please add any relevant lists and maintainers to the CCs when replying
> to this mail.
>
> Thanks,
> Mark
>

