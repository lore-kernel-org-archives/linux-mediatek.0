Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2B08606A31C
	for <linux-mediatek@archiver.kernel.org>; Tue, 20 Oct 2026 02:42:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=vQ3OU6yl;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=N1AKUibu
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8OYBYLm+3KIQaLQWB50G+yMGf6VXI81nazyohmh2FJM=; b=vQ3OU6ylBFDUxGR8Jj2eXJtfKP
	V2KSGWeIixsKw0PJcKRiwTToZB0P7OYfMrspVOSiRKCIiSH2W8msxa4em++4a6OPnu7c+krLduQsI
	lDw/75JuT9rjE/6aJc9iohG63l4ag1sqpuYo++MYTHX10sUMuwEN7RKUUmVx4Dmy1nn0mu4Ot1ZiM
	uYmI3NMcAavYotqvuh68iakYwdgtFz3v0q4wX7fMi4vITjbRaFFQh0TROPCh8yRAFs6hR+OvZ7irw
	Bu9PSnkSL5Mc6elZj1jmEEefcaFnXp2JTyGDM+zQlCeeoxpif6rTxj5USxIg1S18jILgHu81VqYOk
	Vc8SAVPg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xIzoQ-00000008hOe-2wsC;
	Tue, 20 Oct 2026 02:42:50 +0000
Received: from mail-oa1-x30.google.com ([2001:4860:4864:20::30])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xIzoO-00000008hNt-1LT0
	for linux-mediatek@lists.infradead.org;
	Tue, 20 Oct 2026 02:42:49 +0000
Received: by mail-oa1-x30.google.com with SMTP id 586e51a60fabf-48e9476e26aso831662fac.3
        for <linux-mediatek@lists.infradead.org>; Mon, 19 Oct 2026 19:42:47 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792464167; cv=none;
        d=google.com; s=arc-20260327;
        b=l0G/j8r5zgPqWNzAcnD/WG9dajTRVGj9MMs02UtQcg3jiRtEXHwF/qeskzvKzOc2yJ
         9Pk9ZNGCqn4G5k6rLW4SlPeTGMAs26PC7FjGn59owebxx0nhnEVJjYBunb33dln8Skn2
         vsZFX2YfupXUzHoMz+UVPDnrdp/FwxNpqLMxh5nlh1F8J9M4i4KdLrSRvQvqnlMlE97Z
         cEM2zA+tCeuSLhCvxROg/aaRVYUY6U9nHlxEgB2er/FiTRi54c1UbOgx5DhA+2jHiSse
         7i20kehs3wqdmJn0GvnodT10Zd73t4nnHTfzjsUN1tszsSq4F0UDDLZzfw+snqxBzKk0
         Y8Xw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=8OYBYLm+3KIQaLQWB50G+yMGf6VXI81nazyohmh2FJM=;
        fh=K8J1S4FEvI1iAT9vVReAxwedobXn4w3rXUiBRaPEHl8=;
        b=Q/W1JbEdqxDPCfDpFijIYsWWHUxZlwC3E56EjgNREVkMSMfnbZgQsdpPYMd/j9Gkba
         bUtI6G+22EmdJR9YWxq9XADzkWkDkEN5x0Z1O+7u79lu/C3yRN9mM+CWajpQFKrSszW3
         jbeM/CZVmKnWGdXHibOb4Bij1JuWT5ZjAYpOE6xv+n8nBeYZwPE/fAHHJIaTh+RcW+yl
         tdHO9tedZM4Od7x7IjNmINGgFklBVzqclqCoJP27qtNCPhWTus5fMx93hZczc2NnRM58
         CkLHxf3RF//LjIJxWtfLM3a7u6bnPTySHl9AyOYhHYWKHrLawrRqlg+lW1h9r2bcFlGu
         qJrQ==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792464167; x=1793068967; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=8OYBYLm+3KIQaLQWB50G+yMGf6VXI81nazyohmh2FJM=;
        b=N1AKUibuP4lD2SCGUROtKloUiwSuw1IyJYhb03JqDwQ2insQSv8lKOn7wiSQizdV/e
         vbYJiyhm+kmbJm/fOLS17zome1jTQw05BSstYjAQrEjOzjMneXzi4nSt/fg3lurIk+l4
         30LqO07YtGwUd8yEZr5mXASmI0Apj7Zt3NAqBnVzz2Cqvftk8eM/e+RuCd09Xt4Y87Lt
         psEeLWUlIw11z4fTdKApx96vkFAyg5jOjWRuxtbQ8Y1UqMh0dmU1xu1ueZmY6HejhJyl
         8Larvh2UeTlVNAlVtcSH9OteORZJ//PBlSG1X5DH8ns/Ax0OqlNDjtklmr7Wk4oVo0bp
         DN0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792464167; x=1793068967;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8OYBYLm+3KIQaLQWB50G+yMGf6VXI81nazyohmh2FJM=;
        b=uGWNeefjAC/7sY/ywI2RXZOLSqJJI+H6RGiW4eSBbbNfzVnoQ/GtbhiRJZXu6qmUIs
         dhaDKAnqRKBuLZNMitN2vlQhl7ylVE4uB80nlDioTU5PmHLhG0l9dgi20Mkkl1rj76ys
         d0Sx+SmlkZYAZnjJVGY7OtX50Q7OKcg+JnXwHlfx3TIz0xCnse1suqWy4bDvmr+BHQ2D
         LOXFofruOvOI/Xt8mzaRohMfvXSvRQ/j4ThrOiV/8yXOloLQnM8MZaF85JsXlSjp6RqW
         yEPi/Kd9RcUcJnvAps2GXO0/SpxMldfdAd4AA13UXnYggMvzMOKu6oFWS7hh58f5Mih/
         ZLiw==
X-Forwarded-Encrypted: i=1; AKwUvByGjqRhptFHXLAp4h46+ow9IXl1jh9E4GrTrVDHVSnRPt5PH6IeVc/Cr4VNbVtM6kUnlYF3awlYGjoX4ll9sg==@lists.infradead.org
X-Gm-Message-State: AFq9FYJhHQB+SYUrHZBj98O6iPkht1aFG3VTMKMopKJB/niXJ/zR/qS9
	1xGI1bSIBe4bw6+l3+Iix/pgGUGN2hKoA9HjyGvc5h/UZO5TqP6or2MHy64vZDrPBtQkQjWLYib
	yOyZYHNn8Ti38bSYy3dnIiXfUdZDIRKU=
X-Gm-Gg: AYBFou0qkuhNaX55Ka1D+RIOLrECVESzOZFlpGCD9RWFxOGl/F7iVi3OocfGCtZ3hpz
	j6zGbMTW6oHm1HVjzPsfGJi7LgwwbnrPPESZEzzi2vv0Ny0MqCbeI1jac8/yD8k+4OpfMW9W4Ef
	MxS9o/tCmdxSaF9bhmAl8E1/NE/woaUqN58i5DvcLKv7909kCARXk2kEaDp0W2CBL5DikHaGpq2
	5XdBGai727ZsUzvvLqKaXTtx/+aAldx6UOZfJ6kHZax9FukuM6P92EiMX+bRiqO+A0d1Rv+s2sI
	MtRhkJZ9IOLm8C9iraxX/X68SJmwW1rQsGGrLwX2KPYbkRQh0Fb/tzxZ
X-Received: by 2002:a05:6871:e014:b0:475:a112:1270 with SMTP id
 586e51a60fabf-4a757a3d072mr7064152fac.29.1792464167002; Mon, 19 Oct 2026
 19:42:47 -0700 (PDT)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261016-wedfix-v5-0-8b02e78fd34f@gmail.com> <179214234859.408196.13768026652794039093@kernel.org>
In-Reply-To: <179214234859.408196.13768026652794039093@kernel.org>
From: Zhi-Jun You <hujy652@gmail.com>
Date: Tue, 20 Oct 2026 10:42:36 +0800
X-Gm-Features: AclHuK_uSJLvIyJgGxf5INrqsdVDsAIH1iMF8upEY8ZK_RGHk9iIGwKJao2ZKNo
Message-ID: <CAHGaMk_gjN5v0HBQ8U-8FoS--nWCS-8j1M6LUSSma=rY6pYFKg@mail.gmail.com>
Subject: Re: [PATCH net v5 0/5] net: ethernet: mtk_wed: misc fixes
To: netdev-bot+sinfo@kernel.org
Cc: Felix Fietkau <nbd@nbd.name>, Lorenzo Bianconi <lorenzo@kernel.org>, 
	Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@kernel.org>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Sujuan Chen <sujuan.chen@mediatek.com>, Rex Lu <rex.lu@mediatek.com>, netdev@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261019_194248_372072_ABD6899F 
X-CRM114-Status: GOOD (  19.80  )
X-Spam-Score: -1.9 (-)
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
X-Spam-Status: No, score=-2.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Fri, Oct 16, 2026 at 5:19=E2=80=AFPM <netdev-bot+sinfo@kernel.org> wrote=
:
>
> Hi!
>
> This is an automated message. This series looks like a fix, but its
> commit messages seem to be missing some information:
>
>  - Whether the issue was actually triggered, or is only theoretical
>    (e.g. found by code inspection). If it was triggered please include
>    the symptoms, like the stack trace or error messages.

Patch 1,2,3,5 were found by Sashiko

>  - What hardware the change was tested on. For driver fixes please
>    mention the device (and if relevant firmware version) used for
>    testing, or say that the change was not tested on real hardware.

Patch 1 compiled test only since I don't have a WEDv3 board.

The rest were tested on a mt7986 + mt7916 board.

> Please do not repost the series just to address the above. Instead,
> reply to this email with the missing information, so that reviewers
> can take it into account. If the series needs another revision for
> other reasons, please include the information in the commit messages
> then.
>
> The evaluation is done by an LLM so it may be wrong, if you think
> that is the case please reply and explain.

I will send a new revision addressing issues found by review.

Best regards,
Zhi-Jun

pw-bot: cr

