Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 45DD2D46C1D
	for <linux-mediatek@archiver.kernel.org>; Sat, 31 Jan 2026 02:05:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Et1LJjq+me05jisNBQoUpKr3ed6Fid9VeSP+iy1Nl3w=; b=zJvE0gaYLIaAmk9pb5raPpWuK8
	MisJqPHJf3AyZiDcixauaUD4tlB5DWylzg2/EWu2aDzO0wkCAy4bjfaE3nLbblgj6/nUgglVQ269B
	tMHBZv65k0EKvxFa8I0gNdOcQWOOPDwMvdqIxkW4cf+/1p6clMrLVvNvoUFoEFVwyExd7deNhRHZx
	Es0+2Uno/zJF7lmuSmtogr54W7oHaMoGD/HXyXcV1hWAWtuQpvXfXTyZsutKpBz3bdjtoDwZZsGW3
	TwnVYbF9LDeQFbxfLxi1kR4Qb3gq89piYz42eJmv3mSuCnC179G7WAOVGR5utKY/bcqQfZ6jW0WF1
	PQkao3vA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vm0MO-00000002Dd9-3n6b;
	Sat, 31 Jan 2026 02:05:16 +0000
Received: from mail-ot1-x32a.google.com ([2607:f8b0:4864:20::32a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vm0ML-00000002Dbn-1OhN
	for linux-mediatek@lists.infradead.org;
	Sat, 31 Jan 2026 02:05:15 +0000
Received: by mail-ot1-x32a.google.com with SMTP id 46e09a7af769-7d19bfe1190so1981376a34.1
        for <linux-mediatek@lists.infradead.org>; Fri, 30 Jan 2026 18:05:12 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1769825112; cv=none;
        d=google.com; s=arc-20240605;
        b=Hy/bmX8qgOZv/EUChLjvdqOf/3OV0NEldjEFfRgzhGMFOfQt0WuPZwaP56UQxxtqhe
         H+2qpvN2O/ZyDBic/QAw/sNk3x/zao3dil0ORKPObvI4+hMz7zWG7CD6ur/HVkifkoSg
         w3zLTbekQpK08Dxlp5Mr/E8yf8i7QX13ziENoG7ZL+OD8yLNi1Xcw/Il8pFYiTGu+yEy
         sAAHccPhdPQ89jCz2XqzRBgH+KV4vdU8wACOUsKSPDNig0rEllLjGkXQXntIpz2O3CC8
         ixx8xjuKJz8gAoWe5wChpA34GFIaGSrMr8YwKLQgclXZwOSKIv4LSNBNBQqndN0zZ3Xg
         y8Yw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Et1LJjq+me05jisNBQoUpKr3ed6Fid9VeSP+iy1Nl3w=;
        fh=Pxtx6+6u4bfn5NI5FzuX5dABBUgkzL0XWK7gAwd43oA=;
        b=ITjPsSyhU3zq6BkWj3PpB7FXETA6p0CXaRuHNnOwAezscCQ8HRUTW174M2B24SeAx3
         6OKKvLVp+26TZ1p9jHFMk9B6SOnNlDzMOOKSbtHmcPfB+GcxNydxN7Tt+mvkUli0U0RV
         vlgGNrwDABHQMoi8t5E02rKj5YDQMVyecSP9wfnhtOroZxmvXMQgVjXirplMAv+mjX2k
         sYjRG4jbU1epcBszLqZ4ysu6mDOF9Oa6sUxLGN9uAok9OzCbQnfDCJh2KIRTEl8hib+N
         nvWC+U/KhdNjYFsbJDFKOO4qdF1RIVjE2KaPN3VVQ9Wpmlltevymo14cOx7N4JcD2Siz
         IwXQ==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=u-northwestern-edu.20230601.gappssmtp.com; s=20230601; t=1769825112; x=1770429912; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Et1LJjq+me05jisNBQoUpKr3ed6Fid9VeSP+iy1Nl3w=;
        b=nuSsNLsBOzJht9kxbRmwKE5U6WUdeYGzcH70UV8dg8l8szOS0P5dHxGyY7w106X1cZ
         kmIWmLZyU4q3mC1FIiUhNQDA4LFHzotkBm/OkZOt36h9h9Nk9KZJFqglrWdXi/DMaEte
         8Unp2ApWe6+NAbxOmrsvo38okqwXTS3lXNZ1q8mh9K7LL+OnaEVHX+E1/C6iSf2S5UHa
         1DV+H1ECzS96qmknoh4AGfkC1YH9CXoexmKQbz7bKeJPuPhSGTz88dpTUTYFzh1NzZUE
         CUslT9G9RdcxcW/OfvDRTnJB0jq0SnmBH1VRBqOnujYqAu2xlpt992Oolfm7IFwTwP7O
         Pccg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769825112; x=1770429912;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Et1LJjq+me05jisNBQoUpKr3ed6Fid9VeSP+iy1Nl3w=;
        b=ME6Te3x7pVXZXbiz2RFNPVqV8+Y3bNAXDx+0pxkfHv2jzrTPk4cHQQdf2BrqnsAMy9
         W3twiFay618ohsiBA4qZpgbVwuAUQqHiMMivhg44UCZEvBhMlY3AoPh8gOSnPWN+3r3G
         lXXhJkIc1qLF68Qi0DqTTSUkYs3RcSNYnqa2Xfh1oxHNXgbWQPZRAq62lXC4JlEI5+CR
         HQprSlUnHirxUkF1cBVtnWR+oG7lsRevliymJclXHoK6bAC4q8Y/W78DQ3RREgsJjVwQ
         fY7xv6saPI4w4iDAoG0FZAsYuCVySttzaZC/Mvjye0tgHN2Qg7ZzzwTqJZh6iiR4/oLK
         NLnA==
X-Forwarded-Encrypted: i=1; AJvYcCXQwtD/ENeKJHsqcJ8vgTGrxG2mmejeVrnnjvzTrfr+v41N0IxN0dpNOrRaXW8JhHkT8C/aIWYc4Nc1eLEkkQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YyzWeR5HLnhM6psybm2xAtvaZh48MDEAGmrQiXA8GiTJaHHE7fj
	Tzli8sezThchv+0Fk1f9j4iPM7IvEjrUY5wAXPLnM7tjif7+J2HSiDQnPzfwq/PbrWhHz+ux1Kp
	ghZqwIKvczrwPtlC6FM3GoRdK/zJFbAyFLtkZpWLhGw==
X-Gm-Gg: AZuq6aLEFIzHj9JKe2ABXGb1x4Qqrrn6M/NCRh0bwz8vTkz10UXDNDJkLeBa0lhdknQ
	6WC57DNcHHOzNl7tQ9vVIMfIuZl9459YL6qVtV3l6rMFP8s7gr5o1UVOfpXytSPqkh07hqT6yl4
	GRRs4Iy3MejIE2FvUZqoJuD6qG3HgFYnFil9llX27PfkS1E9PPZAxjaxNs9qOnTSwb+K08r8ro2
	QiAZVyVOSJ2Ui/0Q3vmxURlR6CLSenDoLChqscY2wieq8ymCGpq+iq2e3gxT3nlyqwOKoo7Cv7u
	5vUhDCesKvUY1UqbyH/tnZi5VaNk3IHxiyHaTmGmUc/lAXy5e2W4BDQDeHa61A==
X-Received: by 2002:a05:6830:3698:b0:7cf:d642:d36c with SMTP id
 46e09a7af769-7d1a52a7495mr2787735a34.2.1769825111961; Fri, 30 Jan 2026
 18:05:11 -0800 (PST)
MIME-Version: 1.0
References: <20260130032517.173590-1-n7l8m4@u.northwestern.edu> <CAGp9LzqQ45LAeeG1Cijs1QmtzBjOmML_qY=9Y5zH8tYmZeQWZQ@mail.gmail.com>
In-Reply-To: <CAGp9LzqQ45LAeeG1Cijs1QmtzBjOmML_qY=9Y5zH8tYmZeQWZQ@mail.gmail.com>
From: Ziyi Guo <n7l8m4@u.northwestern.edu>
Date: Fri, 30 Jan 2026 21:05:01 -0500
X-Gm-Features: AZwV_Qj3ZqdJVfOqPn3A8gLGh5XdNUoxV_dzTMgg-iq3V96ImWZgH2oWndFPTiA
Message-ID: <CAMFT1=YkqTrgVTmnf1YLQ_djk-2sU8VpDDDbw=TFBzoWs+MW9g@mail.gmail.com>
Subject: Re: [PATCH] wifi: mt76: add missing lock protection in mt76_sta_state
 for sta_event callback
To: Sean Wang <sean.wang@kernel.org>
Cc: Felix Fietkau <nbd@nbd.name>, Lorenzo Bianconi <lorenzo@kernel.org>, Ryder Lee <ryder.lee@mediatek.com>, 
	Shayne Chen <shayne.chen@mediatek.com>, Sean Wang <sean.wang@mediatek.com>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, linux-wireless@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260130_180513_670238_BA2AA7FF 
X-CRM114-Status: UNSURE (   7.98  )
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

On Fri, Jan 30, 2026 at 8:37=E2=80=AFPM Sean Wang <sean.wang@kernel.org> wr=
ote:
>
> The mt7921 / mt7925 .sta_event callback already holds the lock; this
> patch would cause a deadlock. Suggest adding the implementation to
> MT7915.
>

Thanks for the review, I'll add to MT7915, and send a v2 patch.

