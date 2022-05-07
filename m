Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E35E1C433EF
	for <linux-mediatek@archiver.kernel.org>; Sat,  7 May 2022 15:23:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=EN1dvIYWVrwuGb9DVLl3lPkaQupSXdHF/WMv52O3ZAc=; b=vUMBZ6Nmu1G4OO
	aIzHgnz/j0aYCRB4EXC+nBUPNoL3cP0TeoqNhR/th9BAu/4BPO02i6x5vkuzkZ507RQM6ubJfCwss
	9b6fvtPGY0Du42BhnN7H5lF748S1zj1aJA2EAw/HD6KjZ33mG0GjTTcqr0wlAKTxUNMMPnk1shfAM
	iLJ64EEqZUuij1jeZVK++nUM/44QKLIAF6WNvvqb/AAoYx8BwhB9irpsXuzpd52Jx9LFCJT0w/bn8
	PqR8WLf4JIReGbBTk3Mm6r+0AY8LOpA46znH2BGP1PG8yFPtX6DhtHL2W7sduaOX3J36aTU9p1pQO
	6f5Ic8kWmXFgGB9ihIBw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nnMGw-007Ww5-04; Sat, 07 May 2022 15:23:06 +0000
Received: from mail-oa1-x35.google.com ([2001:4860:4864:20::35])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nnMGk-007Wsz-7D; Sat, 07 May 2022 15:22:55 +0000
Received: by mail-oa1-x35.google.com with SMTP id
 586e51a60fabf-e656032735so10205181fac.0; 
 Sat, 07 May 2022 08:22:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Vfkw9TEuSvE0rf7NTGZm+jRNPS+m8UM4jfYleJJzY2I=;
 b=dRlALCBUBhDl/OKieHfQ0pxKgiE//oTxnop6TQW/2Knb7IFGzmmuUr1z3ECWTtCpma
 5ssjJTIA6VRImBoooABtpArDV6lfuD9DSxJhMc/zTNXaOEa3nj+BYhpUWUYQX6qD/3sk
 8ObaH6I+AqVpEWTO0kN8kP/XznM+DYAWXSHY9JFbmlu4Sx0TKHSvhi9Mu7HscePgHit/
 Ak3vDyMcFCU8x1nKKZkuVa5JM/5HcgWlJTn0C+S+rQs3B+QD83K4tct3q/1gDmvRyINr
 44FfQENIw2dhX96Rry4crw5NkHdnlx0LwOq6bQ7uDscvXQ/mMAt9wvvaBAK1iVqXQ6xN
 nfIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Vfkw9TEuSvE0rf7NTGZm+jRNPS+m8UM4jfYleJJzY2I=;
 b=KhbdjtmWjKhLod7uzED5fj8MAuVvEjcS9lDm8FAIvTtNwz6pBYr691fVuPxo2jDlSa
 YRklH6UzyWzXZSLk0TgyW7R45DRsZTn4RAQWTU1kfyIeHOFaKNDr0UVZFbBJIgBQj/TU
 WPCv90I28QZ9WnO8MKkn/jp/eVpfJflPaWAQY/gZo10fIqYGRIqaZEbKLKff2clt/LjV
 cGuMRgebbeC+Osxd0GGHc9yjLxcliALweFErz0fmnFqnl8U11m2nwV0mS8eM4UvZbOEA
 ca8RgSkDJFfWZue0v8nh67vXuAlKlbDSGIgHX2+ScfaH2emt0dqkCejvXCx8W4e3KnY0
 gQvg==
X-Gm-Message-State: AOAM531kHFY6uA5JxWxOnebSMbnb+C9kmmATWbU85ToF19Qoz776Gz54
 nDP+yO9WTYmsMPAulkxaaOk7uyUb7aCjA8W3AIE=
X-Google-Smtp-Source: ABdhPJxN44GTIfHBqhAYQNw6XCdxxwdvLIfkCjI7H44OLjM4nUg1Ig0fVDO7rYsX7ryRVRTzuISlkttqM5CIs1oZ6ZA=
X-Received: by 2002:a05:6870:60a6:b0:e1:937f:22e8 with SMTP id
 t38-20020a05687060a600b000e1937f22e8mr6687750oae.183.1651936972570; Sat, 07
 May 2022 08:22:52 -0700 (PDT)
MIME-Version: 1.0
References: <CANL0fFQRBZiVcEM0OOxkLqiAKf=rFssGetrwN6vWj5SsxX__mA@mail.gmail.com>
 <20220505082256.72c9ee43@hermes.local>
 <CANL0fFSmqR4F=9bFgVRaKXyCDocwwhxySUBo5x=12900fhWn6A@mail.gmail.com>
In-Reply-To: <CANL0fFSmqR4F=9bFgVRaKXyCDocwwhxySUBo5x=12900fhWn6A@mail.gmail.com>
From: Gonsolo <gonsolo@gmail.com>
Date: Sat, 7 May 2022 17:22:41 +0200
Message-ID: <CANL0fFTkj=vOGOgHqPxoQ5srC+f_0v6Trwjs03-6UdMYVn6ytA@mail.gmail.com>
Subject: Re: Suspend/resume error with AWUS036ACM
To: Stephen Hemminger <stephen@networkplumber.org>
Cc: Felix Fietkau <nbd@nbd.name>, Lorenzo Bianconi <lorenzo@kernel.org>,
 Ryder Lee <ryder.lee@mediatek.com>, 
 Shayne Chen <shayne.chen@mediatek.com>, Sean Wang <sean.wang@mediatek.com>, 
 Kalle Valo <kvalo@kernel.org>, "David S. Miller" <davem@davemloft.net>, 
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, linux-wireless@vger.kernel.org, 
 netdev@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220507_082254_298676_F238C2C9 
X-CRM114-Status: UNSURE (   5.66  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Going through the source it seems that the concerned field is
is_valid_ack_signal which is never set by mt76, only by ath10k.

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
