Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 27444105F78C
	for <linux-mediatek@archiver.kernel.org>; Fri, 13 Mar 2026 10:14:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:To:Subject:
	Message-ID:Date:From:MIME-Version:Reply-To:Cc:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=UKgT/k2C1o+kran4uP7qxt2QlYjHx6wAEaZEYpVB9nI=; b=HAYj8TCU3whAyDqQk+BI2qmmQ/
	eoLS151rCycmNxGNuZo1/enOILDEpIXQrvMxpLN9FuehpatcyTk8KM39ttjbjTPk+z1qGi8e24GzO
	RrsONIJq6wve5Depddvuen2zBG+Un+EmYsmfbE13vI6FxNIuRv6WTF5FR7PIqO6nZKhb3lwRLko/B
	ixwTB3DsuuMmhdUnjFMJbGcxoGoBwgeVz36wuJCs1MJO03ruoxyC3C23j/Qyqpnl0PiNIHmoMJYpR
	+Xgphy8aKNAvyYthaoe7wFw2b6K656IMcX1qw2H8fVzrOY5qn9KZY42DiO3Woy5YCFuT3AheXPKI0
	taqAwFvw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0zXC-0000000HUpe-39Ma;
	Fri, 13 Mar 2026 10:14:22 +0000
Received: from mail-qk1-x734.google.com ([2607:f8b0:4864:20::734])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0zXA-0000000HUoq-0IAV
	for linux-mediatek@lists.infradead.org;
	Fri, 13 Mar 2026 10:14:22 +0000
Received: by mail-qk1-x734.google.com with SMTP id af79cd13be357-8cb5c9ba82bso12438885a.2
        for <linux-mediatek@lists.infradead.org>; Fri, 13 Mar 2026 03:14:18 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773396858; cv=none;
        d=google.com; s=arc-20240605;
        b=T/iMSj7um+uKJdlgQngJQeVjCfILUJxWC0LBEPmUZAdUbWAMpUpOEUdWjS5WvR7Ycj
         uYLew8xlBCumsNjx4tpX4vw0SKkJURhw1n+DRX9OJVZ5a39nHIzfzNySTUE6OdsTnvvg
         OFCV5g/3Tj9fVlqfhv0+Ab1J2evurLF4xtMuZJsRdKIJ7udtPA7pl3qvw9au0JWIaEuS
         HLFqIJ2yW5+ITth8AtyqYiyZUJut7PJH4kF1CcexcSqgsYBDxPyO987PmE8LNQ5mEmW4
         Rm+GkSKMJwwgBadIylFWaYwvfaNkjvAunkCbxNgmMp1epyyBw+/3yIPshp1QlAJp+05m
         Hkvw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=UKgT/k2C1o+kran4uP7qxt2QlYjHx6wAEaZEYpVB9nI=;
        fh=7q9slQwJZ94/e6e481MFJgYPeNForZhGYqL2OGSLeAY=;
        b=IsWtXKVSJ1RYuxt6OHcCosyp7Yp+SImKTl+0HkVZb+c3QamYkwidWGwykkGIYBTLER
         VM9L9eij0k54u8IPXlYX+IuWn5JPaMICEakB2jDJFA7U4Cn0TfReubkYAs1hcFzc5LX0
         7TekfdlThCuIXYErrH6hpqMhWkw3wH/t1+YLxUugAZoEa+x/+WthTB/zA/qfvbbpWX7Z
         qrIt8Lh5dONUvTfFoKhoUaVMv1fjKRZulcvfHxZRk/avp5uVrkJYnpUS/j2w+mKd6F7E
         yxD3390WZgIBf9uk5jf4jFFTKa9gSQ7l54OwBvmiU2qpm4nLMAtSAjHnxWKXzg0X2t4P
         63jQ==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773396858; x=1774001658; darn=lists.infradead.org;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=UKgT/k2C1o+kran4uP7qxt2QlYjHx6wAEaZEYpVB9nI=;
        b=Ymc+GvRaZHBRXzpw6bZcPrQwmXvbntKvs+8Wvh3nK0pDNdKvRLExv/EX4dmS/pmDLk
         hJb8CPiKJYs33sTcrJaiRidROTKG/vDfizsixKcqdnxltKop0MlcR6VbK5N+tSv9+/tW
         ENH4DnJEUCtuXO5NKDI0Nt7Hj9DLBeKBPU4eK2OtVbbdZ20PHycTu4VnAP3CTGP7S8I8
         zUvrGW0Jr4f6v2lb3U6N6fuHvmjoboiMjzV8iphOXBVICJ/P/nyS7UOkatIWsFgTRvh2
         60z1EY9KMnyrwjUnZk/jMS0CSLsG0KE9UllcaBgGPNdLEgz2g0o4Iaq+VT72OsDhnMWv
         KsjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773396858; x=1774001658;
        h=to:subject:message-id:date:from:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=UKgT/k2C1o+kran4uP7qxt2QlYjHx6wAEaZEYpVB9nI=;
        b=KkHJe72kMHCXAN8/J+KuM6eT+dvg8R94NCaKpP+YD94kW0l85a5UJTqpoMCfvqnL8H
         xlt7WC0DxJavwU0UZ+L2csYThnrxffW97kPpxJmHN9LI3bVUc9rgEjj/k4yzRPhj5whJ
         4SOQI5AU3TLQhrAEJs83XO8pWYoaQFp0HQrlk67bcvVkZKTxohc4O2AljEqQwcrg9JA4
         qjiKh5n1XB8RTBMRkS52mDIHCWQ7fwZoQSH47nxRZaZuFXbgQdBbKqGzNoYeUx+bzkMy
         tIoVcsSZ3lGQqAqsyp27tcIqGv4J+mFKitGUwWG9BrNald0GSOc4RA2/1Yh/o+ICoNlP
         zDmw==
X-Gm-Message-State: AOJu0Yy5ahssnELc8AovTaEqCVT12HiPlkDIa3nFU5vOkJ05dLfzFO4Z
	t+ySh4AJ9+I6ek3vllvyoxrjDAl82qZLAJIf1u8/D5UxvfDg2KaDQbhC15MewkZzuQDGe4b7pvO
	4P7IUrcDB8BTq0rwIa3m8X4en+1BM6rYT/ph8
X-Gm-Gg: ATEYQzz6zlwsiJi1Sb8hvcnBbwfAS1DgU05SmW9DBozKtw67fSG9BwqeqXxZ9pG47Lb
	8Zd0FjFuvg9j/kt6JubE97fJcvpHbhqLcUazTQ0Q1WhAjhEdIMWB183lQXO2h4Si+W/rzxM5JbU
	7v02zAa7596vuitcKb/MzXFu++xwx1oSBHNRPmeOhAmYP0np3l1RPJ7xG4n7DSQRfj9QWK/yfzF
	ydDb0VlXhtToPc69L0MZa08oQVDMUQRkr8REANbVqhnw5siWGV8Ho0BDEcpewa4xVDwVYi8gVDl
	A4PuUjqnTyooydP5qYE=
X-Received: by 2002:a05:620a:2549:b0:8cd:8f18:d1f4 with SMTP id
 af79cd13be357-8cdb5a4abf2mr347328885a.6.1773396857911; Fri, 13 Mar 2026
 03:14:17 -0700 (PDT)
MIME-Version: 1.0
From: Never Min <never.min@gmail.com>
Date: Fri, 13 Mar 2026 18:14:07 +0800
X-Gm-Features: AaiRm50TsotB-kwFdxtccjiho5ZTwHKzVX8fDD7ANi7AzhC2MnHOZQ2Ew6k0od4
Message-ID: <CAJEczdQ1eVLhbf_52yrQReOTtGidPvi+feTmRZ7nxzATUyuhXg@mail.gmail.com>
Subject: -join
To: linux-mediatek@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260313_031420_140112_45DD3193 
X-CRM114-Status: UNSURE (   2.13  )
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

-join

