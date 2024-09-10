Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 68848EDE99A
	for <linux-mediatek@archiver.kernel.org>; Tue, 10 Sep 2024 15:56:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oLtfco7CYTSkruhDHn9AtchkZ7x9E9bb03vUF9ZRl8c=; b=CMD/5UCbY/veUAF4xa1rdylkFr
	+a7Xw5YWySMM0r90CXq9KMZHYlnIB0IqPwNKxqlE4C7QFV66A4LD9JUWVKXlpXZp3PuDWhCQxpYta
	Rlcw/IhmLWjD9ydY0bzAlJjz20iQNwPChAj6gHUtDD72lWP7Ai3K5vKl5QRbpLdZWyKUmZNrLHHtQ
	Wz+el2NOo3rp1b3zOPhhQKs3vor6HRh09OIYjmB23PDbSkEsNdHXTjb1kOognIBArsO66CQi6Iaoq
	ODATLAefpEVdZmnBOk8Eyx/k3wwyj0sEdK4RCcxCFUcCMrdw17OqGeXdtcInHdBtoe6YNxANsFoCy
	oDycsBgw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1so3Eb-00000006FOu-10OO;
	Tue, 10 Sep 2024 15:56:53 +0000
Received: from mail-qv1-xf30.google.com ([2607:f8b0:4864:20::f30])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1so3ED-00000006FJr-1Gta
	for linux-mediatek@lists.infradead.org;
	Tue, 10 Sep 2024 15:56:30 +0000
Received: by mail-qv1-xf30.google.com with SMTP id 6a1803df08f44-6c34fb4f65eso31841376d6.0
        for <linux-mediatek@lists.infradead.org>; Tue, 10 Sep 2024 08:56:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1725983782; x=1726588582; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=oLtfco7CYTSkruhDHn9AtchkZ7x9E9bb03vUF9ZRl8c=;
        b=ZbWrnm/hbQJoCL3nGsNbbYYtVM6NbQ3eQbSRTmlhhy6ZVQYajepLZw/fWDzjUrn9Ct
         QQ2rdEZWog1OOmx9Xhgu5285RqnZKmQmxo9u1/OoixrGbIbbfl+pjHn5ALk4BGvmng86
         yHlRVu/dPzG4XZRuhxxsiH0ff0SnIKxnq/JcEwjmVmeAtp51ZPuz5ork1Wc6JQFUHpXc
         08byU+8FCAKS0BZ9sszcwWSoWQeHCqB64nfIKG89XRQbq/sYJj0n3aXIoO7uoRDd6o+i
         X78vbDPDN644zItlsvkYacMshWElaViYASAJ2ktGf34/xWEeaxrBibz16//C50XIG4DB
         cGcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725983782; x=1726588582;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=oLtfco7CYTSkruhDHn9AtchkZ7x9E9bb03vUF9ZRl8c=;
        b=iHneSO6Agc4ukW3qZnpCYZ0mIK4sBOgNyP7Abz1rhFkyLnaOswyl1FC1KaJHGowydG
         S8yzi1VgW2UhFPY2flsbX5Un4Xhen1Oh7rveLpUzyd6FvtWXe6tXswIW6OsZp9sQIgcG
         A4j76ZUnLQvfeZ5ihYvh+jXmBra4DVR6T/p0R3YBNiYUu4iRsLpGZ4Wc0s9+CjVF2xlr
         p6PPQsiXecZ0EJ+HkzES+ZGGDW2tixInO1zmsivtKZu3fUQAKl1AkgE4RlhefBoh/3gU
         a7mN7f1dB0P177uFfauIOJALdMmsFUQIu4FWCJyMpNx941lF8LuZuhYSopKj+5eueN6b
         VHbg==
X-Forwarded-Encrypted: i=1; AJvYcCXJB+pQ3JTH8ei4voLTR86fNdn69bl4fGs+WL4z050Xz40SutfUqO+NOPFAcamoPKtEoXfNTOpfCqewOchhBQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YwEfyOza0nVpG3qsjMUxfnJKBS5TLExxntLwuJvxEzGbQMXjtNk
	lU2lX1JH8ydUSDxLgz9C/2mt1TmQyzBzaX/+41RaeuaoAMiP2dqQyEuKgUshZdPWPbHvqm93kin
	oTDGpYF+caJ4IF4XYeeLr2Ss5hSRPiLnGZQY/
X-Google-Smtp-Source: AGHT+IGjnS6T1YSBZQm5TgHbGqQbnZdjhAVyhHz/w/yZFD/IJRKBg9fxXjQPZwO4fmHS1elYcV9OtRw2gB9k6sok1Hs=
X-Received: by 2002:a05:6214:245:b0:6c3:7030:d28a with SMTP id
 6a1803df08f44-6c52850e5demr159245696d6.43.1725983781736; Tue, 10 Sep 2024
 08:56:21 -0700 (PDT)
MIME-Version: 1.0
References: <20240801024335.12981-1-mingyen.hsieh@mediatek.com>
In-Reply-To: <20240801024335.12981-1-mingyen.hsieh@mediatek.com>
From: David Ruth <druth@google.com>
Date: Tue, 10 Sep 2024 11:55:42 -0400
Message-ID: <CAKHmtrQCvDO=0m6GC_dkcqbnCUhsCk2hemMsLmrpcFsQsuRHoA@mail.gmail.com>
Subject: Re: [PATCH] wifi: mt76: mt7921: fix using incorrect group cipher
 after disconnection.
To: Mingyen Hsieh <mingyen.hsieh@mediatek.com>
Cc: nbd@nbd.name, lorenzo@kernel.org, deren.wu@mediatek.com, 
	Sean.Wang@mediatek.com, Soul.Huang@mediatek.com, Leon.Yen@mediatek.com, 
	Eric-SY.Chang@mediatek.com, km.lin@mediatek.com, robin.chiu@mediatek.com, 
	ch.yeh@mediatek.com, posh.sun@mediatek.com, Quan.Zhou@mediatek.com, 
	Ryder.Lee@mediatek.com, Shayne.Chen@mediatek.com, 
	linux-wireless@vger.kernel.org, linux-mediatek@lists.infradead.org, 
	Michael Lo <michael.lo@mediatek.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240910_085629_363893_D840BDA5 
X-CRM114-Status: UNSURE (   5.19  )
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

Tested-by: David Ruth <druth@chromium.org>
Reviewed-by: David Ruth <druth@chromium.org>

