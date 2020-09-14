Return-Path: <SRS0=gVFe=CX=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.0 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 38852C43461
	for <linux-mediatek@archiver.kernel.org>; Mon, 14 Sep 2020 15:17:50 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E3A5D20756
	for <linux-mediatek@archiver.kernel.org>; Mon, 14 Sep 2020 15:17:49 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="ekH0IhQ0";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZkkzAsQB"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E3A5D20756
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	MIME-Version:References:Message-ID:In-Reply-To:Subject:To:Date:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=wQtF8l7akDz8bMrS/wY2j55FKuoQL7kjGRl9KKhd07A=; b=ekH0IhQ0Eo3Qs9CufVZiAHju/
	naGJYX8Vu+xwbm2C1RBFRbqMPpBjfCnXXcOM7Y8OObS2OCB8W2Y2NwbWHP0EnrZPzYsJpVrgCRYOQ
	HAnqVTv8qc8J+WgxN2E5iTQb060bbAnafyO3QpLGEvanrTJ5humcNmnXxu0rPkz8HfFoGoK53ADVI
	QxZXwoHb326wjONJVC6HRchCdzfyWhQ551QWlIymfOjm7DMer8xP6Ch38wp9jFnNWTOEG8fpG8UE9
	4vBb3bHIL/Fmm7ydaqMvS/C6gE1l9egdlWeGbobyzzJ1t5AdBTDl6gHKHpZgQDnptXoaakOJiAItm
	zuNLnij7w==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kHqEd-000422-Gt; Mon, 14 Sep 2020 15:17:39 +0000
Received: from mail-ej1-x641.google.com ([2a00:1450:4864:20::641])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kHqEY-0003zO-Ax
 for linux-mediatek@lists.infradead.org; Mon, 14 Sep 2020 15:17:35 +0000
Received: by mail-ej1-x641.google.com with SMTP id lo4so486607ejb.8
 for <linux-mediatek@lists.infradead.org>; Mon, 14 Sep 2020 08:17:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:date:to:cc:subject:in-reply-to:message-id:references
 :user-agent:mime-version;
 bh=qovCS0lUGNbN0RSVrQ4gEm2nnw0ctOzM5yUEbqbGJBg=;
 b=ZkkzAsQBhIKVoa25FG579fQzAwVnl657yNv8wR6Z7qurTMC3CE116UYbbOwNoa+OfS
 brLZD3gYnN2Kd++jo10cASyXbJdsFb0YxIL3kMt8qOoYABb7UmbOO9BB17CMaGkshbrO
 lUGYOZZN9YF2QhzPW4t0fw9Iex1gYCsdCFCKPRmoB76tR3rToehQ7oQuLqoWREK8Y6La
 imQ2+WoOi/5xlGImBATstUx2kcJTb/druQfjnUop0+KtZ6uKkMds5mHnLlaibJOxXYHS
 3dSpaRKTLqLATnmhmsDdQVhYxASrZG/E9c+NnyKtLlQBaFzHB+w8i01FJcBXfJKYPd6b
 uLXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:date:to:cc:subject:in-reply-to:message-id
 :references:user-agent:mime-version;
 bh=qovCS0lUGNbN0RSVrQ4gEm2nnw0ctOzM5yUEbqbGJBg=;
 b=NVfMy0wEm6cU2cQKZGXCJsDkyf0UiRWyohV8NBwPJxtuda1y8qCyGFccmQrSHZzD38
 F24WhWo+Ty3/ru2ITy0nS50GKeF9G6Wvv4lhvDlKsGE40pYQpeVaxbBWRlVkxGmvKDfw
 8vOvsPiIA2j7RqVxmpO9vPnqzUwnCQKrhWXLe8iVGyn1bS4/qk5YQd9NLTFpm67MozT3
 JjLabL22feIbiPMWzLOvoRG2BOYHPjxcRF5cym0zYCNNBllX6RQ1+WG+CMppwaX2n35O
 MhqX5THttyz++xX0p1Ekec/i4DPC46nQA8xMSYgsXB0yxiI1HUPL5WDEEjdmEy5AKG4K
 Rd9A==
X-Gm-Message-State: AOAM531rNkjYtRCPIP6w8rFbijw/IZ/jjdoxyw5yfRjy9VIm7ubzCTlm
 yFcTdBSlDezCQjjZStLvHAY=
X-Google-Smtp-Source: ABdhPJxIAUFHAfu3RDslU9vgvwk6iqEcGv2wBvJ9c+hW9ci0omsWODnK1/P7J/8OY+IKJdWZqPSmfg==
X-Received: by 2002:a17:906:4c89:: with SMTP id
 q9mr15895080eju.290.1600096653239; 
 Mon, 14 Sep 2020 08:17:33 -0700 (PDT)
Received: from felia ([2001:16b8:2ddc:3000:7936:d9d0:986e:cca5])
 by smtp.gmail.com with ESMTPSA id a15sm7956002ejy.118.2020.09.14.08.17.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 14 Sep 2020 08:17:32 -0700 (PDT)
From: Lukas Bulwahn <lukas.bulwahn@gmail.com>
X-Google-Original-From: Lukas Bulwahn <lukas@gmail.com>
Date: Mon, 14 Sep 2020 17:17:31 +0200 (CEST)
X-X-Sender: lukas@felia
To: David Woodhouse <dwmw2@infradead.org>
Subject: Re: [PATCH] MAINTAINERS: make linux-mediatek list remarks consistent
In-Reply-To: <7da64c0975c345f1f45034410c9ed7d509ba9831.camel@infradead.org>
Message-ID: <alpine.DEB.2.21.2009141715350.17999@felia>
References: <20200914053110.23286-1-lukas.bulwahn@gmail.com>
 <f6bc41d3-5ce4-b9ea-e2bb-e0cee4de3179@gmail.com>
 <alpine.DEB.2.21.2009141208200.17999@felia>
 <9c5aaa15-bdd8-ae4f-0642-092566ab08ba@gmail.com>
 <alpine.DEB.2.21.2009141552570.17999@felia>
 <7da64c0975c345f1f45034410c9ed7d509ba9831.camel@infradead.org>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323329-481114173-1600096652=:17999"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200914_111734_531744_2D0BF3CE 
X-CRM114-Status: GOOD (  24.90  )
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Cc: Ryder Lee <ryder.lee@mediatek.com>, Joe Perches <joe@perches.com>,
 linux-pci@vger.kernel.org, kernel-janitors@vger.kernel.org,
 Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>, linux-kernel@vger.kernel.org,
 Bjorn Helgaas <bhelgaas@google.com>, linux-mediatek@lists.infradead.org,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Lukas Bulwahn <lukas.bulwahn@gmail.com>,
 Pia Eichinger <pia.eichinger@st.oth-regensburg.de>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-481114173-1600096652=:17999
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT



On Mon, 14 Sep 2020, David Woodhouse wrote:

> 
> AFAICT the linux-mediatek list isn't configured to automatically
> moderate messages from non-subscribers. Its generic_nonmember_action
> setting is 'Accept'. That is the default setting for lists on
> infradead.org and I strongly encourage list maintainers to leave it
> that way.
>

 
> Lukas, I don't see your address in the allowlist either.
> 
> There are other reasons why some messages get might trapped for
> moderation — the message size, number of recipients, spam score, etc.
> 
> The mere fact that *some* messages are moderated does not mean that the
> list is "moderated for non-subscribers" in the sense that the
> MAINTAINERS file lists.
> 
> > Bjorn, with that confirmation and Reviewed-by from Matthias, could you 
> > please pick this patch?
> 
> I think we should be fixing the ones that *do* say it's moderated for
> non-subscribers, not the one that correctly didn't :)
> 

--8323329-481114173-1600096652=:17999
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek

--8323329-481114173-1600096652=:17999--

