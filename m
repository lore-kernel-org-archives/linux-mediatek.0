Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C4B6C27C55
	for <linux-mediatek@archiver.kernel.org>; Mon, 10 Jun 2024 16:17:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9nCNK53rTjLnVysfgXoglxvrQ8+xq11LiIZcoNznmu8=; b=U3w33CbgL0+11RCz2BEWMqiRXn
	xGmV5/WqKaN9nUnFQLAjIicv2oYj2T6HXHHimSTR0AwXMhiMnTI7d2uNS9Yn9tpXl7Xq3qfEYQm0S
	G40+mE33Yz6/b1MyjDCTNrGPXxKaUcSyfc0Gt1lIBqSXY3+9efTa/wjgqQRfrIruH1ZnNCh7PgaFU
	ytTtBWxfrySp1luXF0bH/y4M7UayzHdQNjjuTnLxVGyuL5lJQpKPfPWnJtERkZryCh/LrrL1XulVV
	9LRBQuTrdWXRUQrBsdRhDT05NXYvVkwcsPTGuttVWeclQRbcfpkeEjNnzoB/jmlqSx0E3AEzMv8NZ
	fMRJbsqQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sGhiH-00000005kHE-2lFN;
	Mon, 10 Jun 2024 16:17:41 +0000
Received: from mail-yb1-xb2a.google.com ([2607:f8b0:4864:20::b2a])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sGhiE-00000005kGd-2HRz
	for linux-mediatek@lists.infradead.org;
	Mon, 10 Jun 2024 16:17:39 +0000
Received: by mail-yb1-xb2a.google.com with SMTP id 3f1490d57ef6-dfa79233c48so53079276.1
        for <linux-mediatek@lists.infradead.org>; Mon, 10 Jun 2024 09:17:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1718036257; x=1718641057; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=9nCNK53rTjLnVysfgXoglxvrQ8+xq11LiIZcoNznmu8=;
        b=vMDBXWgBSCgQXxXa9/BAnMhDERhUaiSJJxP+UFam40l3Y5uDwAHhCpka9gWpBMn6eo
         QWQJTKTp4+ZFiN2xnHbuSLgbpmfwJ1P4N8hX2VwJgwUR/WYdM3QqOsTg0CitKv6fiaYn
         wF2eULSfclUU8tajPZ2OEcQdIt/IKyS6TExGb0DMHdSH/q0Tp6tRiV4WWcWA7Rq3eNn7
         KTe9iBvPn7cp33nm51DGJ5i28jEKo8IKvF+Bl2EGIn3txJPq7PAzJvXRB6BMO2gwlyoe
         ZwiHdyLF0/9vUI2bk6kHBlhcCyoLMTeZ16SuYH0CEPklR2QZdksrkUZnTEyfMeh0VvH9
         zx/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718036257; x=1718641057;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9nCNK53rTjLnVysfgXoglxvrQ8+xq11LiIZcoNznmu8=;
        b=Vz5QXe1y4a/op+9JKzHRieVGFzmmjJai2KdRfDrtYlTCjJBFFkTKMdEsfg06BcrT13
         Y2lBDQJabpf5gGI5YwcgFVMRut8KM/oC+JtSZjvb8gsmNb3SWA2neQZcZPH9RISgH1nG
         QUq31Bo4Zx75B50BkLuKDMDoRycJoDyHFbQYE9STN1tsFVXPITG6P+fS/ECWgric3hZX
         fuwNn2m4uvquAg6+X4CoB2g/B99XFDTNj6j5csBcWJwFVsCCwAgy1Qq9rHFo/CLG9HqZ
         gMwJTJvlexetjIqKzvG9H29LwK0QyXDLT9gpqBljVLOCamXuij7Ue7j3Aw+TGWGi92wC
         YJaw==
X-Forwarded-Encrypted: i=1; AJvYcCWSYQZ9saLUe99cUPjCYYe06Z2CUeMwqcaN5Z9XxSA2XSbnP8PDuSxKWkN8Js33yg9vLZOnerttRmqpw1hAhWHADiU5oRdJEs+FVjHGg8Gf1nob
X-Gm-Message-State: AOJu0Yw6N+AhWSUuHAfK73544UANjDRUWL5vl8vLYNaMvM4Kh+YfzFTx
	/42f7Idz0BLuVNmk1LUn0VlrVAa5BiLHjb9yLsu8pp56CPAZInDzTLCB+ydPVyv69aGHLvDVYBe
	wsXRwzuClewpYJWnFY5s+cJhlru8A2/Tz8ThE
X-Google-Smtp-Source: AGHT+IGHJhDjrNJNxMp3w5oXGpyMNhws5k+6BrcXAVGbf0Vl2CbGh3uFcZ7sKIzHCofvwFIyh6Vw241h/NO5im+uDIE=
X-Received: by 2002:a25:6b0e:0:b0:dfa:e130:3144 with SMTP id
 3f1490d57ef6-dfaf652cda7mr10333881276.17.1718036256629; Mon, 10 Jun 2024
 09:17:36 -0700 (PDT)
MIME-Version: 1.0
References: <20240412085357.13756-1-mingyen.hsieh@mediatek.com>
In-Reply-To: <20240412085357.13756-1-mingyen.hsieh@mediatek.com>
From: David Ruth <druth@google.com>
Date: Mon, 10 Jun 2024 12:16:59 -0400
Message-ID: <CAKHmtrQRQPNJ9vcvD0GFVWL10iAvjaUnbgVZa01p+BgRHreq2w@mail.gmail.com>
Subject: Re: [PATCH] wifi: mt76: mt7921: avoid undesired changes of the preset
 regulatory domain
To: Mingyen Hsieh <mingyen.hsieh@mediatek.com>
Cc: nbd@nbd.name, lorenzo@kernel.org, deren.wu@mediatek.com, 
	Sean.Wang@mediatek.com, Soul.Huang@mediatek.com, Leon.Yen@mediatek.com, 
	Eric-SY.Chang@mediatek.com, km.lin@mediatek.com, robin.chiu@mediatek.com, 
	ch.yeh@mediatek.com, posh.sun@mediatek.com, Quan.Zhou@mediatek.com, 
	Ryder.Lee@mediatek.com, Shayne.Chen@mediatek.com, 
	linux-wireless@vger.kernel.org, linux-mediatek@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240610_091738_590048_30BCCB53 
X-CRM114-Status: UNSURE (   4.41  )
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

