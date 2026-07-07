Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 20192C43458
	for <linux-mediatek@archiver.kernel.org>; Tue,  7 Jul 2026 07:55:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=45TUjnFLPimeXg8OXKr+ik8F39XYQsq1QYkNFiI3doc=; b=d0lCoJxpGptn7doIugwP8cJWfM
	oFnSK9YxY8tOjSWi5jWkk0ddM5WKBriejphi9pvdRJuSkCr9qXseG0vMX2CidZuo+f3gXVHjtrx+0
	4RL04GqtoTEIGrthXWltEg2EsEIXI3z2+RS7eG0oP4DveJ9CRbCyOHsf3cKHN34ruTncF84dhvlbP
	VDFAjrRvlj++drU0QkBKWXOKFTg4AdKiYh34up17PQljudNm/fRu3c9XCz/m17QSUfUKYwJxaw9R5
	H9cupkVovm0349EQFwK3gZLpYVvrvyjBr8qBTSTa/6sVv7X53jel4/K57iwOHkrEf5x+ga2VqZRuF
	dC6lPnBw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wh0e7-0000000ENhn-0jTs;
	Tue, 07 Jul 2026 07:55:11 +0000
Received: from mail-qt1-x830.google.com ([2607:f8b0:4864:20::830])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wh0e4-0000000ENgX-21fM
	for linux-mediatek@lists.infradead.org;
	Tue, 07 Jul 2026 07:55:09 +0000
Received: by mail-qt1-x830.google.com with SMTP id d75a77b69052e-51c2cce930cso41898271cf.0
        for <linux-mediatek@lists.infradead.org>; Tue, 07 Jul 2026 00:55:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1783410907; cv=none;
        d=google.com; s=arc-20260327;
        b=p4b+nk+6rZv2SDu2JkGwPYiTAFCPHyuaTxKZdlwOpB4r0dQD+okwy0TACR0YQFvVt+
         cPSS7zeGprTTD0jCNZLDMTFFHhnx3mkbDcfQsVxMRzRSb5dZd+HyJh1DCJqo3Ou/qp97
         Zju9KNmOr3fkwyqfWK8JS2Kru91Ai/yvNYzkWIbRMZuiXIF07eK5zLbrwvUyNrpEY+NQ
         k2kUU3zZMOyGzEVPT8JQXGispK/Ub4FdaZnGl/1ydz1r7EKe57JlDyPPNfU8XxBGr3qC
         yao1bhzpF3PXsg9qAt3Z/VHgg5ueM5Lh5hjAlqUnCXg24YwbYaFMMJ+Kjqxy3g06uF1C
         UvZw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=45TUjnFLPimeXg8OXKr+ik8F39XYQsq1QYkNFiI3doc=;
        fh=e5z3S6ZxW11rkbWreJ9xt4V24qERrVLHytliedTXZMI=;
        b=gLechaZOzudUOL5wr4jL5Omlc1olAvsDpIwjhe+5hyEjB2ZJ/g8AsmpqWBpmFHuoqi
         e+GSeERnEepyhpPcrtEgviWVo201nQsEqfSM1uTnWItC+cSUmDwscXWUqCwxW31NT9l2
         W/yFjwr6D0pe9q6rMpqyg7PO9/6E1aPcYAO4CTwKsG1XIPB/8BVlssxM9gIy8XKsVo4F
         +PJtZX+0y24oEdJzs+/4p8PLOt4TRFY7sk8hqFh1jJ2E1juUbNGBNuwLT6YNz+10Y9XH
         5/UySBPFRMoP0RcvRcyUyMgd/Lxn7oBMLYwqSmuRh15+RUCFLJkMuhuXi+oZiun3KZ7f
         DgSQ==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783410907; x=1784015707; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=45TUjnFLPimeXg8OXKr+ik8F39XYQsq1QYkNFiI3doc=;
        b=i+803W2n2V2cxrhujNdttzihwdz9ibfsv89laWs/geDGg8nFrzcJr8yQyN1KE3kmn7
         8ZFAW43L2v/4Dcq62kJ1lAgg0X4xSP6kw/1HfWeuFEt7V1y545Uj7dX2yy1fpqIoiJoh
         Jqwk20pK1s8Rtdp406tE/t3jdnDQu5ItjmtPEIWhNdRPxys1SmZsZWF+pRxwJUGr+yTw
         Tk3Go72W2AdMy2HXnYvBptk+ha1sOi76NsoqL0kAzYll3yGgcPDVpb6rGHPVBMziyFxn
         UcltSm0k8SBMSjfO01xqb+5gBNx0iprplwvGcHwBHxr7XCZuXnrtLBP+SEbra0iwXkt6
         VO8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783410907; x=1784015707;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=45TUjnFLPimeXg8OXKr+ik8F39XYQsq1QYkNFiI3doc=;
        b=F2b/t8xDwboCMY5UmuhstcPFxHVhO0W6GuH5kxkyoZKRqBXXq42g25WBBiWmwFijJ4
         RziXbl6BX+rv7ldAGin2yQJgQBL5SPbQzVXqOAAPPhb2uy+BxCs8Z9duKo1J4EVU8G2c
         rtuN8P2yULOBeHgC0gTxJK47uCpt2XzxxC6aXdbP4Czh+ejeO8kLkQPUviZ6Pt8Impda
         JXYkl9mDjADlYwIFNLjgyb2i9h47K7XrAWsySWKm4452oMPjbFf66LvK64n0to+dTOYc
         XvpKuvCTYX3bdINOxr9l/vUx7E41tjzaHw9JErVKTciqpgYa2Y2IiIpd2W44MSDbiPkV
         pvBg==
X-Forwarded-Encrypted: i=1; AHgh+Rp8I83Rfrkm/5ZQdCnqe/2FoXelQO1FDBQial1UZzF8kAs259urYZ9TsnDNJPq47RQmwLzuZJ6L56shVkL5zQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YyqQH/DUTrBBr7RLDWPqUkxRHMiAcH3v5PpAMc4Kh4AfkEgfJGV
	FnFUZIdlRGmj628mDpqo8aG99YuGfShEFe+3mLi5+I912gWRdF2EUN0MeldXQ0ZejaUWJ4i25WE
	gI6msiLwtEI/Rv6kSzSwMk17kJWkRXDcI0hiFQ9Q=
X-Gm-Gg: AfdE7cnUxkBOVVDJgsvJ/BdMjGJhI/icNjjkNryrm9pmidAsagYJJ9RWridme+1CGnh
	bV5hsaJUYAXDDkGuzbdUZkKYtrzZ3KMGE+uAC+QjmcFNrtwFpBug/GUM70eFn8Ny/WigZRjolUU
	epXzlnvdhZU89UouYI+nIZXH3Fowb7jyoByQMwzZ7OHk2RXdI6nA6DBlSHcEYK0WBwuWVSq8GPj
	D80ZVG7Unp6H0v27cW3cTTNFzvi2xe1o8eb7QErJGBAg79sJy4JyLyxLB+kw6P1h1PNtH4JPS23
	50sl9Hl8Vo6ZfC4=
X-Received: by 2002:ac8:5944:0:b0:51a:8c97:fb9a with SMTP id
 d75a77b69052e-51c748e99d3mr43147321cf.67.1783410907124; Tue, 07 Jul 2026
 00:55:07 -0700 (PDT)
MIME-Version: 1.0
References: <20260629142348.273766-1-akkun11.open@gmail.com> <akwJmKqZJS1sJzFk@redhat.com>
In-Reply-To: <akwJmKqZJS1sJzFk@redhat.com>
From: Akari Tsuyukusa <akkun11.open@gmail.com>
Date: Tue, 7 Jul 2026 16:54:56 +0900
X-Gm-Features: AVVi8CfBz91Cjj_2TyUNSllobZ66hJIFMho_I-2O9RLREdueZiXV-s936xkFDMc
Message-ID: <CAKr_iV5zZ2TR0cE6E8=5JLYqFwYsvGEs8vqKL-rN3RtuSu0Unw@mail.gmail.com>
Subject: Re: [PATCH] clk: mediatek: fix memory leak on module removal
To: Brian Masney <bmasney@redhat.com>
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Chen-Yu Tsai <wenst@chromium.org>, 
	Miles Chen <miles.chen@mediatek.com>, 
	"open list:COMMON CLK FRAMEWORK" <linux-clk@vger.kernel.org>, 
	"open list:ARM/Mediatek SoC support" <linux-kernel@vger.kernel.org>, 
	"moderated list:ARM/Mediatek SoC support" <linux-arm-kernel@lists.infradead.org>, 
	"moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260707_005508_533393_5F389C13 
X-CRM114-Status: GOOD (  13.08  )
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

Hi Brian,

On Tue, Jul 7, 2026 at 5:01=E2=80=AFAM Brian Masney <bmasney@redhat.com> wr=
ote:
> On Mon, Jun 29, 2026 at 11:23:40PM +0900, Akari Tsuyukusa wrote:
> > diff --git a/drivers/clk/mediatek/clk-mt2712-apmixedsys.c b/drivers/clk=
/mediatek/clk-mt2712-apmixedsys.c
> > index 54b18e9f83f8..24522fc24019 100644
> > --- a/drivers/clk/mediatek/clk-mt2712-apmixedsys.c
> > +++ b/drivers/clk/mediatek/clk-mt2712-apmixedsys.c
> > @@ -129,6 +129,7 @@ static int clk_mt2712_apmixed_probe(struct platform=
_device *pdev)
> >               goto unregister_plls;
> >       }
> >
> > +     platform_set_drvdata(pdev, clk_data);
> >       return 0;
>
> Please add a newline before the return.
>
> Also, please split each fix out into their own patch to make backporting
> to downstream kernels easier.

Thank you for your review.
I fixed them in v2.
https://lore.kernel.org/linux-mediatek/20260707074839.240676-1-akkun11.open=
@gmail.com/T/#t

Best regards,
Akari

