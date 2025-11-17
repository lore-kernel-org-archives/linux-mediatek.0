Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6D70FCE8D6B
	for <linux-mediatek@archiver.kernel.org>; Mon, 17 Nov 2025 15:09:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3zbp3rv3Pbtp6BhnnUjE7+HUOuLx/KIf8Dvndl0seZc=; b=MXlf8qO5cMvSVXVfXQF4VBVybp
	yCe4PsrYnd8jbY1SwAbvVnNIK8y842oo5eaYc9gOW0RmvGq7xMkKSz+JpyPPa2TAh6S0q0Eb3BEei
	HjrvevBARBM0mEshDR6rTO+9Jy1yDarYY8Upkl6dqt1hz4ou4a6FgGVENv/oiGBCGK13bL+RGRnlQ
	vcr1t87E9aUmdtVrwSAPrkSQFqDZmL3bGW+BdvVFd+iuCv6s4LEZvbtBzd65dqdPMNw9fS4ftDaSC
	4Dl/38NRBDFt3SI2IKU+IblQ1cCc5kkmPTFtvcCPQXK3yHYlK4m9NU6CoCEo3sj/t/+AfLZIHZXCC
	xwFtrOVA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vL0rG-0000000GJCA-0XwM;
	Mon, 17 Nov 2025 15:09:34 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vL0rD-0000000GJBn-2Eh9
	for linux-mediatek@lists.infradead.org;
	Mon, 17 Nov 2025 15:09:32 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id A617C44256
	for <linux-mediatek@lists.infradead.org>; Mon, 17 Nov 2025 15:09:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7537EC19425
	for <linux-mediatek@lists.infradead.org>; Mon, 17 Nov 2025 15:09:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763392168;
	bh=3zbp3rv3Pbtp6BhnnUjE7+HUOuLx/KIf8Dvndl0seZc=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=kw9Nxu5ejnAZFvD3mnDxi6HpQkf1TgCNkug5+vryg+OfHvPaua1TmSfausyzdSJSj
	 j5/XRGmsUjmRLpF8lA27iWNm9p6msDA6JNDADSqp7hWFEEnt8QhzXM+sKx/q7gy3+d
	 IZRxiGHrFG6pwi8hwjiI5aV+AJUJhHXQ5kD6iW9UwcTV0JTvf0ctvr86iH22FOu2DX
	 30qYOr+WjJdeCTYviJlpMzx6jRQIbVY/JMsJbPZ0kXa1nlGKRMVk18OydnPp/v7WrT
	 Bk45BmO7n4l6lB0KkTXhRC1fabRjX8qEiMjsjGuppD9QFm3w7stbi5O9Lreuv+mqkE
	 pJxhqzJCc5lgw==
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-7b9387df58cso147994b3a.3
        for <linux-mediatek@lists.infradead.org>; Mon, 17 Nov 2025 07:09:28 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCWyJX+JdP2PRS/poVSKHgNUJibLcEU/C84/ZtpxA5XtAzneYeQHqzCv5j6l392tQApXgrEwi0rT5JyCOAiScg==@lists.infradead.org
X-Gm-Message-State: AOJu0YyOMQV20cvUZY1D5I0egJxRm14dtwA6lgm0E+ptLG/oBspAXmmN
	nXcbDQFzdLK8XaCjFiDIXBxsNK4JbMHSK1fDoCl2qtFHPRKbSqE0y7l9Y7ZJiT/2HSfh3yYgq9F
	Sk/wxCqU/DE1axcOFsSglIz4MinzRCA==
X-Google-Smtp-Source: AGHT+IFX3yT4m31cCyb/Z1+I4aTapLK5A2aAWg8mzrZJNC4ShJE0Imif2VAN6sLkFovV/4nwzbgRRFZL/2cPkevezx8=
X-Received: by 2002:a05:7022:98d:b0:11b:b61a:a497 with SMTP id
 a92af1059eb24-11bb61aa776mr3945411c88.37.1763392167590; Mon, 17 Nov 2025
 07:09:27 -0800 (PST)
MIME-Version: 1.0
References: <20250923152340.18234-1-johan@kernel.org> <aP91AfdoyESxqfPG@hovoldconsulting.com>
 <aRr6Bj4yrcKN-jUD@hovoldconsulting.com>
In-Reply-To: <aRr6Bj4yrcKN-jUD@hovoldconsulting.com>
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Mon, 17 Nov 2025 15:09:15 +0000
X-Gmail-Original-Message-ID: <CAAOTY_8B8svZDHcLP0yRfU=2oTEe2RU+iz5Vpbhy77tvq9yM2A@mail.gmail.com>
X-Gm-Features: AWmQ_bnoz0kpERdVA_cJtV4JW9qwxQ8EFQkGKR1UJIT7D9EKmhqQzgDRCdCXfdc
Message-ID: <CAAOTY_8B8svZDHcLP0yRfU=2oTEe2RU+iz5Vpbhy77tvq9yM2A@mail.gmail.com>
Subject: Re: [PATCH 0/5] drm/mediatek: fix probe resource leaks
To: Johan Hovold <johan@kernel.org>
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, dri-devel@lists.freedesktop.org, 
	linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251117_070931_591212_76A37BCD 
X-CRM114-Status: GOOD (  12.76  )
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

Hi, Johan:

Johan Hovold <johan@kernel.org> =E6=96=BC 2025=E5=B9=B411=E6=9C=8817=E6=97=
=A5 =E9=80=B1=E4=B8=80 =E4=B8=8A=E5=8D=8810:33=E5=AF=AB=E9=81=93=EF=BC=9A
>
> Hi Chun-Kuang and Philipp,
>
> On Mon, Oct 27, 2025 at 02:34:58PM +0100, Johan Hovold wrote:
> > On Tue, Sep 23, 2025 at 05:23:35PM +0200, Johan Hovold wrote:
> > > This series fixes various probe resource leaks in the mediatek drm
> > > drivers that were found through inspection.
> >
> > Can these be picked up (for 6.19) as well?
>
> It's been another three weeks and we're at rc6 so sending another
> reminder. Can these please be picked up for 6.19?

For the whole series, applied to mediatek-drm-next [1], thanks.

[1] https://git.kernel.org/pub/scm/linux/kernel/git/chunkuang.hu/linux.git/=
log/?h=3Dmediatek-drm-next

Regards,
Chun-Kuang.

>
> Johan

