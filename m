Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 71012CA5FFC
	for <linux-mediatek@archiver.kernel.org>; Mon,  5 Oct 2026 09:36:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ALY8PRLZB7eYZm4BgZsEwueCWb0wgVU/gIyTN+rhhkE=; b=kgX8Vc1zYrisgKSrDmVDEfE1s2
	Jvq/TWE+kMdzY298e06fzpxyKEl4YVlbM1ZD7n39y7eFD3Khhs3dQyUdDBehOh/Q0xtcpRHOPUDar
	AdkCp+z35I1ZqysraRp84Ku+GBvXlP0Eu6FrEfmwAePSC6aV0XeDk79djspTzm8hTAHIt4RyJqp48
	E+ZgZ4aYBgdXwc73kPZCq0xRFeiTapb4SUq9B2J6yFxMW61SWq0Tyz737IV7xhTCrFfF14FFgLS2T
	6eJKKPcJ8TzsMGsXP7WH6RertDJn6VcywR4mL5vCkDNuePNjIZx/XF9Lo6ca7hMtHQayht5Hl1Yuv
	S7Z+q+Qg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDf7t-0000000G1AM-0Am1;
	Mon, 05 Oct 2026 09:36:53 +0000
Received: from mail-pz2-x28.google.com ([2607:f8b0:4864:3b::28])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDf7q-0000000G19e-0cTd
	for linux-mediatek@lists.infradead.org;
	Mon, 05 Oct 2026 09:36:52 +0000
Received: by mail-pz2-x28.google.com with SMTP id d2e1a72fcca58-88a0f29ce98so654154b3a.3
        for <linux-mediatek@lists.infradead.org>; Mon, 05 Oct 2026 02:36:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791193009; cv=none;
        d=google.com; s=arc-20260327;
        b=QxBjjecUuCWhUD0N5ACnboYk360Zx9Gy5jfRRosXIQmbZ4ZwvjSKM5zyQNKSkLvOXg
         wID4m768zv9P31LylnEB1zZFrNXL6iMXWu2HeJ08rhyGq+fcUZWLflErb5UZbf8VwxEO
         sKAIEpfHSW2z0bevM8KBEcYxUoCFJcsB5Ymir562xkZWqJnnyoCVE3npH54pNekXAlO3
         Hy0HnHEx/P2iwgtaS57CBDxEqeqlfIdGMPpBWPsqz91Iyv8CfWFE2boNF7Ws/W2L/6xM
         Y6iL6uAec4jY+IWPR7TIJu0/oyLAhxieJKBo0sD7VdIsrWFa+mBLIOdAsJjU0fcn22Mq
         ONMA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=ALY8PRLZB7eYZm4BgZsEwueCWb0wgVU/gIyTN+rhhkE=;
        fh=9JwRYYj4/rDNgBdWAqfgy5QedUd5NDXeF8/ijIzWOYM=;
        b=qvU8+4D0+s02cITxFQ9AQNlaAQeoj6bLI1mUkmbI3HCd9TewA9PSkZ0O3ncucgYTJV
         2L0IsdjzioWs2czcEZvSS9K3ZI8K33CvQkvifzRnBVs+VRgz+BeKePDoBjV2KIpLluFb
         oqae6rmLZyuY7meaQRUnMndNP3V+jA6Dwn8VmjTtKdIQhGsE6blaWhH63VPYrNJ9yFIk
         jjefj8iDna/sSW7DHqpJX80MvQc3os7vO1PnU8864oy1KFJD2hyBMTdupF+VWMvxTGlG
         JDmrxQe+Fx7920tAtI5W4f3nt6x5vTffhBl22Q7SdT4qQUfe/IHPpWi2EPo8R4clHoig
         hhrQ==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791193009; x=1791797809; darn=lists.infradead.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ALY8PRLZB7eYZm4BgZsEwueCWb0wgVU/gIyTN+rhhkE=;
        b=N6jWEqz2ECZvGMe38NZj3ZhnIjuU5pl27MAQDkVa47bi7Lz+O8YBFNnBDZ6au9aJ63
         U39Q+kFb6ziBJRHYWgZLcaPOWZVT4W5g+mwVfSpzWeMrbTSCDwlLPuxwvIcUoXLunQdp
         jNIsWsVrMcPsOkJxCbeCS03jP+8K/oS3sYcbz0d6gNsroMlLHfm8ToHDf4AHpbatdtVH
         sbGDe1c8kBZVFDSnNUnpLF/D4fveMITP0Q08xo38bdn06cNLhKRwuGaAriTOhb7UR6ts
         lqScKBV3uoq6E5/s6FC1OMKKPtP7Ra+L78YIZ5C0mK8MWMu4WYeQMZ3DfMkzffuo9roV
         yGbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791193009; x=1791797809;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=ALY8PRLZB7eYZm4BgZsEwueCWb0wgVU/gIyTN+rhhkE=;
        b=v9f6+o0S3xDMBEwcqLqi/ij+k5NeaMg/hqIn2d5x51yYe2I3o3h18WgO4hF0Vyaw4g
         esBgbFtm9fJsyVfoT6SrkwlX0WYalMITcMcaPgum74waFLpS4F4CsIo2IM34R1ZSr0bp
         J6xSKBIUEDg2tUyWfBDrn7viY4h/fwgDf5qLo4XQBBi47oMnOTQYsX4Igi+3rQJ0F0od
         ch01bVA0coCg/wHcIMwOoxc0nOg9IyZZS9efSowuNmAyY6YFJUfkbB7uKEkFjcElPD4n
         mIibSfJXbGax/ydmHQtg3k42xGALW7PW2cFvOFTLfIQ1m+6FpmaRtawbnuGYlCzjzDLy
         O1ig==
X-Forwarded-Encrypted: i=1; AKwUvBwBTo6lskMVTtQSyrg3d1CGNU9X6nHtd++XNLkn3kl3mJlIMVqYt5XtWxYPK6GyRu/zFEmE9c4kWFcbejlwWg==@lists.infradead.org
X-Gm-Message-State: AFuF++l3ZjpQNCe9AjGAoL10SIqeTsO8FRZcennunNH7eJGwbxlHqSCQ
	3BW0bGBdY44JJnmyG9bo4DUotYphXV1/OUyoEMabJWadlXdXr5jIp4AuOKLKVxo66LqpVTlWDAQ
	86rSf1HhjKfYkvwUUzGEqZWNyOKzF6kk=
X-Gm-Gg: AYBFou3NYiFU/JvRv+IkeUYPWPKMH7TDqGgccIvr7CR0kp/uaoDPeBPW+aLj6ueMpWu
	P7r4VZ67Ou4IjfFNj4l4X1RF6Zj9tElnebM1b3p72rc87vMQEL+v3pnBNSheboGn7BXPru+PB+p
	sfO3dKPGCZ6h+SAzqFUcQx7rvnF8c4jmL0RiI0XgOlgJ0td/ZswlUqmcc0WCjivV2yCZZZ+Rh94
	c8OCdKSaFLG/1niHXBcTs6sRJbri6eA2zZafQyic0JPcwatuNTw+XV4UZblKAmNpD7Lz7jo7tB7
	pXu5APmEpGz4NRTXb7kwJvRvo5xRvVsnq+OoMS2iWmgucp7jXoL7oc8Vev9OOWbU6avuxWOOx2l
	8jBdxuZBu9WrLpXCTwoMK8un2+Xk1ARORHOTOeIDAeEtXrzbXDYfauc7hJI0bSYpY+QM=
X-Received: by 2002:a05:6a20:ad98:b0:3dd:a196:308f with SMTP id
 adf61e73a8af0-3e0bd41280fmr9275066637.63.1791193009054; Mon, 05 Oct 2026
 02:36:49 -0700 (PDT)
MIME-Version: 1.0
References: <20260925044908.450775-1-phucduc.bui@gmail.com>
 <20260925044908.450775-7-phucduc.bui@gmail.com> <asKt42FgsbhSbQUP@sirena.org.uk>
 <CAABR9nFyEJBwXP=4SjuGNfGQJub2y_DPE87c6j6BPmqMBgjESA@mail.gmail.com> <asNbjSrPYVbeqSae@sirena.co.uk>
In-Reply-To: <asNbjSrPYVbeqSae@sirena.co.uk>
From: Bui Duc Phuc <phucduc.bui@gmail.com>
Date: Mon, 5 Oct 2026 16:36:37 +0700
X-Gm-Features: AclHuK8rGaIRVCf1BZigYTPKZbRcvBezN-u_N5cJZ31HBEOmlU5r-ZSIA4c-8uQ
Message-ID: <CAABR9nEXM1OSnV6L4=N1YCbtWn5yMNr+OMEZ4p8h3WMaQXbgmA@mail.gmail.com>
Subject: Re: [PATCH 06/14] ASoC: mediatek: mt8195: Fix FE startup error handling
To: Mark Brown <broonie@kernel.org>
Cc: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Trevor Wu <trevor.wu@mediatek.com>, Liam Girdwood <lgirdwood@gmail.com>, 
	Matthias Brugger <matthias.bgg@gmail.com>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, cassiogabrielcontato@gmail.com, 
	Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>, Liviu Dudau <liviu.dudau@arm.com>, 
	Haotian Zhang <vulab@iscas.ac.cn>, HariKrishna Sagala <hariconscious@gmail.com>, linux-sound@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261005_023651_281923_5D9EA75A 
X-CRM114-Status: GOOD (  14.15  )
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

Hi Mark,

Thank you for your feedback.

>
> > > This will return 1 if a new constraint is installed which is not a
> > > failure.
>
> > Do you mean snd_pcm_hw_constraint_integer() rather than
> > snd_pcm_hw_constraint_step()?
>
> Sorry, yes - Noticed it in the _fe_startup() that was called just
> before as you say and didn't specifically check that function.

Some MediaTek *_fe_startup() functions (mt8195, mt2701, mt8188) can
return a positive value on success, e.g. because they return the result
of snd_pcm_hw_constraint_integer(), which is 1 when it sets the integer
flag. Others, such as mt8186, return 0 on success. This looks
inconsistent.

On the core side, snd_soc_dai_startup() only treats ret == 0 as success:
it calls soc_dai_mark_push() only in that case.

Is a positive return from startup intentional/allowed?
If not, I can send a patch making the MediaTek startup functions return 0
on success.
If it is allowed, I can instead change snd_soc_dai_startup() to call
soc_dai_mark_push() when ret >= 0.

Best regards,
Phuc

