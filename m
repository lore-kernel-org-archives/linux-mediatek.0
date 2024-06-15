Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5CA75C27C53
	for <linux-mediatek@archiver.kernel.org>; Sat, 15 Jun 2024 06:50:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=w9q4rwux8PEpDu8FkmvSmiQpihIq57Ai67mpNZdkY4E=; b=Tji/jmfBsGqVMSRqcZMG1FA1ln
	HsDJCOIyWPh95+lsVzE3EQnjYQFoM5Xqk6khjv8uabn9u2OzfPqp937qxFnDM117q+IjSOzMdXTuM
	MJZLdtbrUHFt7wKyzAS76l0SZ7NhuTRaGkg4wCJWvy25Kj/yGVjgQWFmnd4FTAA5LX+9hNhVXyraU
	eEX4c53r3APiaN378gW2uK5la7jpV6SPExcfvc2HLlTJ+EAS+vSe1avOq1c5NZeVP5ZYFwM3OdQ4y
	qecf3+WJ4DlhKDHSkHlo7zyeICiX9bGyxtoStCy4ncN5Qs4VSh9x7cYn+q+VawKQEOkLGh+IfQSYP
	BA0dg8pA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sINFF-00000004pnL-3BFF;
	Sat, 15 Jun 2024 06:50:37 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sINFC-00000004pm4-0GWq;
	Sat, 15 Jun 2024 06:50:35 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 76E2660B2F;
	Sat, 15 Jun 2024 06:50:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CBC95C4AF4D;
	Sat, 15 Jun 2024 06:50:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1718434230;
	bh=w9q4rwux8PEpDu8FkmvSmiQpihIq57Ai67mpNZdkY4E=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=qhgKAkUvn34QdT1i/JjLp8ZMBSvz2h3t+YJ4dXJeoY1P4ZNoSooW2wzmrH9Ih4XoS
	 +bjqPbCQXJIBrDZ2Orn/E0cwhxixbjU+8ZWbEoiFnFgOoakohFvZK6847rd5XgVKG7
	 CDanbZdsHu4r36jNOqYG2FSLbIFWCpFH8ZkWepN3ZORgkKq0Hn9HxLhAortgP1igx3
	 WSlCCnb+6GUPMHEoPjxszA/PkjfHZntSWrdhzVKAGpSKxYJwtqiwm10d1VWzIqyc7I
	 +Ud0qXnaRlXBQtKZWEsMBNK3COv8nFN6IsfpV4Jf5wbbwEemWLds6fI6qoKleMNV4M
	 OWdpGgg1g6s2Q==
Received: by mail-lj1-f173.google.com with SMTP id 38308e7fff4ca-2eaea28868dso39402451fa.3;
        Fri, 14 Jun 2024 23:50:30 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCV0gijwVVGq+WNrX09EhyiN4V7kgupWQIycP4rROeXgCa/mHlXUQUW2T1JW4ymssizstowK/8veBnaEuNjvzG9Kgf0bB3y42Wy7Yrc9mgr300FW7S0988RaQDFEZ6GjS9JHED1Ynknnd5A0DbzotXVzp0ja1hturcA=
X-Gm-Message-State: AOJu0Yy0dcD6xNS6vEpMO8MnoPqtUP6Bmuulma8KKWHJmphjPq90LAen
	l8V3j8g6TQi9P1fc6DBuj5UBEhe1CFdXAZYtw+jnxVe1BrLERDkSOx7ty1VvitIbP81VPb79Dm+
	2F+UoIe31ma0egYCmq3it6CGYh20=
X-Google-Smtp-Source: AGHT+IE2jBzSWlCnzMDvbaAU1tAdAo/962aKov4fx3jwh5Oyi/Rg12iVqSJi65SEdda6X96E/o8cRRLhj3ohFjqRw4g=
X-Received: by 2002:a2e:a443:0:b0:2ec:1973:2b89 with SMTP id
 38308e7fff4ca-2ec19732c1amr25512591fa.30.1718434229513; Fri, 14 Jun 2024
 23:50:29 -0700 (PDT)
MIME-Version: 1.0
References: <20240614071507.11359-1-mark-pk.tsai@mediatek.com>
In-Reply-To: <20240614071507.11359-1-mark-pk.tsai@mediatek.com>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Sat, 15 Jun 2024 15:49:53 +0900
X-Gmail-Original-Message-ID: <CAK7LNAQ7rWh_=2WVV3CXTyda=6sZacrkYT=qJw3sJOAFpyH70g@mail.gmail.com>
Message-ID: <CAK7LNAQ7rWh_=2WVV3CXTyda=6sZacrkYT=qJw3sJOAFpyH70g@mail.gmail.com>
Subject: Re: [PATCH] kbuild: doc: Update default INSTALL_MOD_DIR from extra to updates
To: Mark-PK Tsai <mark-pk.tsai@mediatek.com>
Cc: Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nicolas@fjasle.eu>, 
	Jonathan Corbet <corbet@lwn.net>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, yj.chiang@mediatek.com, 
	linux-kbuild@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240614_235034_246380_306F1A55 
X-CRM114-Status: GOOD (  10.24  )
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

On Fri, Jun 14, 2024 at 4:15=E2=80=AFPM Mark-PK Tsai <mark-pk.tsai@mediatek=
.com> wrote:
>
> The default INSTALL_MOD_DIR was changed from 'extra' to
> 'updates' in commit b74d7bb7ca24 ("kbuild: Modify default
> INSTALL_MOD_DIR from extra to updates").
>
> This commit updates the documentation to align with the
> latest kernel.
>
> Signed-off-by: Mark-PK Tsai <mark-pk.tsai@mediatek.com>
> ---

Applied to linux-kbuild.
Thanks!




--=20
Best Regards
Masahiro Yamada

