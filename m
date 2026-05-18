Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 98632CD4F3C
	for <linux-mediatek@archiver.kernel.org>; Mon, 18 May 2026 16:39:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qU7uUs0NK6uKgPUe8Qg+r0hQV4tX0S6hMpE5TbcUIzM=; b=M5Fdy/ik3JhhYu5cUk6YpAIdqA
	7WuYoHXDgNPS+K/D3fdtGSLq6qD6wWGq4623z8okmj+0yPyVRuGfYS5XGwt/M2tz6vI2cpW3GymTk
	SFY3bXt8rjk1pztuW7FYiQNW0Gn9RYOKps9Xflhb68pKcGJPQ39kTTEn9i3nNEDOrf/MRGt0Q/4f3
	5oJcRtFRUU8YtEDpqgbYpqbX3ecj71trrZ3s3p2HZvBPKu/LDyq+D6WMWxivChc9E8w8f6x2wW1Wp
	IvX8oNh4Xz/8szeb0fa8/tccDNq+NNteM8RNO8h9vXwhKvAhoIpsfrdTRSEt/E3auNhfIiT71KIIB
	TFGBYL0w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wP10B-0000000GJyw-1a9p;
	Mon, 18 May 2026 16:39:37 +0000
Received: from mail-yx1-xb12f.google.com ([2607:f8b0:4864:20::b12f])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wP108-0000000GJxi-11GD
	for linux-mediatek@lists.infradead.org;
	Mon, 18 May 2026 16:39:33 +0000
Received: by mail-yx1-xb12f.google.com with SMTP id 956f58d0204a3-65318dafbcbso2452935d50.2
        for <linux-mediatek@lists.infradead.org>; Mon, 18 May 2026 09:39:31 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779122370; cv=none;
        d=google.com; s=arc-20240605;
        b=MdrzRtVLsTc8/rs3Lu8X4SmSo73g1vQpGTIs7LX1nOuE5tSc97DNoUjFCbYWg+ayaE
         0SMSHGIOGlC6lnuN9NCWTo6CaH0PBNC7AhmIr9liTXwomkxtMuzcFUFC3RFZTo9L/8IW
         3OElGwvU5sbvLFU7uYr3P/B9REITiVXteFb0F6FM5sWh861h9GZAsgK0GYk+PJHTLS+H
         9imIczzfl0lBPTaKjtkNuwpc2/sOU6D/finG0Bew6YSrLhQwiea9v/G+njJgoRLmXEQv
         +hx74fNIr8SBm5+OdiafRrzF4DpdEvIdPzk54//g7uqAPs79eohBOR4RSCq9rlmomXDy
         3DSQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=qU7uUs0NK6uKgPUe8Qg+r0hQV4tX0S6hMpE5TbcUIzM=;
        fh=YClQrm7CRuXQb9kMFKtw3LDrGSxGxhidIMeFKZsbu/4=;
        b=U/Y1J50qrmXw4ZyG+QOIJyJ4OakjBG5xxzufYPHdEo0mD2nvvwcWKA3gRWF6jsuh6J
         WmSsvfD00z0mkCyBewJWnlISuJBYAfotiiL2X+g6dwdGf8gWZ0M4alTnQC9ml1ca8B/k
         tBUQQ17ffyHmVKc55SsZA0va1LazIpnkxs4osc3p44b+QLUZn44FxD+VT0bw5WyFfQvK
         fSTwMyz3Z2cQ/JhGP7QM4M8MjOjodQ+9gPKk3dS/dPeMB1dqOZuhh9mbHbKQDaDdM0DJ
         WhRub3KxBKatzCZCPyzsxmLZ4MwF3o2rUXni5uOi/jDod3ZNY5HFFlNVLSDsCW5yrKFa
         p6Yw==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779122370; x=1779727170; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qU7uUs0NK6uKgPUe8Qg+r0hQV4tX0S6hMpE5TbcUIzM=;
        b=kWVkyUsVpHf7hz7Y9hChQanVoeBnJLf4vRpGucJEFVakP+sIYoDwRmbdEStO+tP846
         GMQpgEDYHFS90+zst1gsC7g9K5ajgem5/MjPwCsXHoiKiZCf5V1OA01j/wK9ftMdwAhB
         f/H7Zw+nsRVZHbVUxixnnsP6G6qT8c8DSbEz7Y9u+SuUBmlVr0ULsEG2/++A6idXBUq3
         37mS5dDafQeJMrhfI8GABos8VGGcsSz1+pgRq2nsgxpCPEjH3ItbZrmlUK7ea8JbXvQO
         fqCRsyRuJ2+Nxdc7Uc4b+LvJTfRHqK1HirmWIfbRir1Dig9/LhQzarSgZnv/owgcR6L9
         XNnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779122370; x=1779727170;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=qU7uUs0NK6uKgPUe8Qg+r0hQV4tX0S6hMpE5TbcUIzM=;
        b=H8NT9NMIpfLzb1hPWkpDcs3fMG0fHSzjwqsIZ+BVZQ+IuQ358uzdImbFIvGc/24D9f
         APOaz3U/Sxjw4gS/SyFax4gf6xUeXE3T/kKr579pD12uzhD4iH3aFU9VBkiz+3G/cCxy
         5ab2zGRDjisNghMqmswmMxvmIe53oVGFIDygS9gbFnfyvrHPISJk25aq7lC32Pkafq3o
         PPlB2JIn4GMB6MBCpHaHT86GbEyI9Z9uaY7FGEoq6PzC/r38MVm3O7SM60r6ktQQOXxv
         ZMc2cNBTMEGccGU/kqWzMXk2h7d1P9zwbKS+aO5TjwdJab4iPfsKiGTTzGo3XRISzOiN
         EYxw==
X-Forwarded-Encrypted: i=1; AFNElJ9Yc9EKZsIMzGku3qaeeFralzTFfsU8TE+bUBQ4bZ67tCcr1Z9CJDhUtZHDx2cM1zC6FMuwKqqKS4JIoqPHqg==@lists.infradead.org
X-Gm-Message-State: AOJu0YxMui+omVjWvOu5AavMNu2QV3qBNJoqHg0QBd/hMskxIeC9selQ
	9uW+Rbse3cYt+W7fi3W8I+SuTxW2JrrxFMv06zOilXiUtSbXU3u/cq0ahhD0v2ES0d+tT1r+hkt
	JmQKMbGekgvoJDy3iMnWSHwGTVrrw19Q=
X-Gm-Gg: Acq92OH+yWFtFArr7vDGvDPp39LBHQK0lxGvoQWdkRMk8Ga70KPvd0PLobdPhij3Lnz
	+OjBYBqsx4gGNulTfCqlE64kA0SpM7Oj0OqH8Z6VtM+4Tou+T6M/K9vD+fVUOdzZYXYbKwliYgO
	lwz8LslWVEOLUCUz3wAyu5A3MmxoUnjjCpRzAp9GwlJmH+x3Ol/1S9wTEkKV8rUw9uVCniWz7i4
	9gdIBRMpusPynCURy357GTVxRNsOa0LxxtBTGjidV1bremqZho+CVAClSE/V2IvYlaq/G3Kuhgl
	/gqxR74ynVE55l60S2qTt2cw238IXCp6Z8E+PGqThCve5HyakKlU1Qbci9hqA3DbUxY=
X-Received: by 2002:a05:690e:151b:b0:651:be68:77e3 with SMTP id
 956f58d0204a3-65e227be426mr14633351d50.31.1779122370411; Mon, 18 May 2026
 09:39:30 -0700 (PDT)
MIME-Version: 1.0
References: <770d36b07311bf88210c187923f243fb9f126f04.1777058551.git.pav@iki.fi>
 <79571779-316d-4d7b-bbca-554328ec7dd6@gmx.com>
In-Reply-To: <79571779-316d-4d7b-bbca-554328ec7dd6@gmx.com>
From: Luiz Augusto von Dentz <luiz.dentz@gmail.com>
Date: Mon, 18 May 2026 12:39:18 -0400
X-Gm-Features: AVHnY4JKR7EW2Y7fh9Ry1FXstveHWvemeXRYsMRqeLo5qpbHBWWCY7ZWjLaMSPc
Message-ID: <CABBYNZLe0UGzJ-99uBWosy7exYNQ=vLr1018x2e2ugsCWqTKUg@mail.gmail.com>
Subject: Re: [PATCH] Bluetooth: btmtk: accept too short WMT FUNC_CTRL events
To: "Artem S. Tashkinov" <aros@gmx.com>
Cc: pav@iki.fi, linux-bluetooth@vger.kernel.org, 
	linux-mediatek@lists.infradead.org, mark-yw.chen@mediatek.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260518_093932_288098_9869E7F3 
X-CRM114-Status: GOOD (  10.00  )
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

Hi Artem,

On Mon, May 18, 2026 at 12:33=E2=80=AFPM Artem S. Tashkinov <aros@gmx.com> =
wrote:
>
> Hello,
>
> The kernel bug tracker already has half a dozen bug reports in regard to
> this regression, yet almost a week later I still don't see the fix
> pushed to stable.
>
> Please do.

No offense, but I recommend checking the list before generating this
kind of response:

https://patchwork.kernel.org/project/bluetooth/patch/20260514172340.1515042=
-1-luiz.dentz@gmail.com/

PR is in progress and will be merged in the next RC.

> Regards,
> Artem
>


--=20
Luiz Augusto von Dentz

