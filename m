Return-Path: <SRS0=MDpP=IQ=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS,UNWANTED_LANGUAGE_BODY,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 82792C433DB
	for <linux-mediatek@archiver.kernel.org>; Thu, 18 Mar 2021 13:19:05 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1489064EF6
	for <linux-mediatek@archiver.kernel.org>; Thu, 18 Mar 2021 13:19:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1489064EF6
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=aKSIp2FO+pYllrm58BK85CqQzJf+hgmu/M3u4KrN/JI=; b=hyBn5jFRgKCIwwm0/Ezag448U
	OSCXx5mPEGwG9oMjs88wsSY+7qekRziQwwwM2BukY6fxfUjRRzDZDGBKY3EfPB87KEsXthE9Wr4xQ
	l1N9I95FeAHVSs15rKhZvHV5EBD2dnbsa2v4UjD9LJRTYpilMcbYVlHhNb/uV0zPS9ajJ/Wx9D06a
	HLzHEk5DqS936vYJQfUOuxfhEKo/rYZRrvlLGXEEL4Okelt8/nr3Las8q0vRZ8G2S5GT6HFENu2m5
	ugIq44a5N4Mw5iJelHVgCh2MHZB9T7dkQa11gcC4oybAmhTpdmqbVx6E+vUL/Hp6KhJqEFYiOaYUU
	ZiwRmuuUQ==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lMsY4-005M3d-T3; Thu, 18 Mar 2021 13:18:49 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lMsXk-005Lyz-Fw; Thu, 18 Mar 2021 13:18:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:Content-Type:
 Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:Sender
 :Reply-To:Content-ID:Content-Description;
 bh=JOJrTHLb0ihz7n/SYAQuT+ba9XVrUtogTeIgI12q8XE=; b=uh7ogaF8vltJ1qihn5a5Eq/QUP
 Bz65eK6LEQ2hEr46m8+N3G3d1xxIR/5Q34mY9DRAkpBnnAEoY923HjKNQZy9z0wNY8RPL/4LbYJYj
 UoMcjwvvK/nZLgqntWP7nCJ0xn3J+RJyIdMO5ZlVYXOzQwfJugMcMYyYUMIio3ttWCkRDme0ENjPy
 luooDRWzl6jSU9sQj9qbxQBRUiZ7kubbssZ5Ip/XD1erT90pheF4+HEx28ZFDAN8cjyPU+aajOgfk
 pwloVxZeZ1DrTbmuVDEnzjhoj2psNDj2cFdSMvWfJO5uRupd1JUGIWhivlWSzHNbSihxXmWb8hMZs
 o4ZxkkWA==;
Received: from mail.kernel.org ([198.145.29.99])
 by casper.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lMsBS-002yco-Is; Thu, 18 Mar 2021 12:55:57 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 514FF64EED;
 Thu, 18 Mar 2021 12:54:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1616072055;
 bh=PIgoILQ+JXQLKgHb4EX46KzQNin7qaWoZQINVA9rRg8=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=VM8uQb8n/g+eow1038PB3oZRgVelzhtSYvgJI8MQqo1iAMnUhxdMgv106lxMicZ1Q
 cEAz8GE+D+1MmgYU+plwG6FP9I1LGuLZBWA6CEhW3dbbYLaL+q/xba7NWBVVUXSnhO
 /EnXkZ+kYh1MrYkVXEVondrGhlT3o7Eg2SjZbg0ZQjlWl/GVtr0vXj6uftVzTNGSt6
 qYJbtg8C4gKegkvBnPQhxWhDqpUfM+IZNlKtGDPAEx/+yOv8Vg1tp0WIfJ4d0AC7M4
 ZBcGj0GbqKApy92ULDA3xumziIdyp4F0rlKYef9yfmSAbVzXB+12xRTzXfzk8ac02K
 MmK6yxy0yFa3Q==
Received: by mail-wr1-f50.google.com with SMTP id j7so5425271wrd.1;
 Thu, 18 Mar 2021 05:54:15 -0700 (PDT)
X-Gm-Message-State: AOAM5337V1EBOxuyf3a+NKmQQEtH8GK4g2iP4Y5mn8YczEDxbq3VaYrC
 kvW1LUhFg050YqM7f6WY0NZ/S2UyovDbOyQIWQ==
X-Google-Smtp-Source: ABdhPJwLERCk/N5J3yNu9yr15qTSlb8M38k26qtsk7H27iH5P5Ntdy0rj4/mqmw1+bjPHgvQ7F5zwKMruCOCx4m9TeY=
X-Received: by 2002:adf:e84f:: with SMTP id d15mr9572196wrn.394.1616072054006; 
 Thu, 18 Mar 2021 05:54:14 -0700 (PDT)
MIME-Version: 1.0
References: <1616046056-29068-1-git-send-email-rex-bc.chen@mediatek.com>
In-Reply-To: <1616046056-29068-1-git-send-email-rex-bc.chen@mediatek.com>
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Thu, 18 Mar 2021 20:54:02 +0800
X-Gmail-Original-Message-ID: <CAAOTY_-V7=ooGE1DhAjQR4MrsCmwocARYqUkB_aoJNbVK8Hdyg@mail.gmail.com>
Message-ID: <CAAOTY_-V7=ooGE1DhAjQR4MrsCmwocARYqUkB_aoJNbVK8Hdyg@mail.gmail.com>
Subject: Re: [v5,0/2] Add check for max clock rate in mode_valid
To: Rex-BC Chen <rex-bc.chen@mediatek.com>
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, 
 DTML <devicetree@vger.kernel.org>, 
 Linux ARM <linux-arm-kernel@lists.infradead.org>, 
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 linux-kernel <linux-kernel@vger.kernel.org>, 
 Project_Global_Chrome_Upstream_Group@mediatek.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210318_125534_442753_07A625ED 
X-CRM114-Status: UNSURE (   7.52  )
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

SGksIFJleDoKCgpGb3IgdGhpcyBzZXJpZXMsIGFwcGxpZWQgdG8gbWVkaWF0ZWstZHJtLW5leHQg
WzFdLCB0aGFua3MuCgpbMV0gaHR0cHM6Ly9naXQua2VybmVsLm9yZy9wdWIvc2NtL2xpbnV4L2tl
cm5lbC9naXQvY2h1bmt1YW5nLmh1L2xpbnV4LmdpdC9sb2cvP2g9bWVkaWF0ZWstZHJtLW5leHQK
ClJlZ2FyZHMsCkNodW4tS3VhbmcuCgpSZXgtQkMgQ2hlbiA8cmV4LWJjLmNoZW5AbWVkaWF0ZWsu
Y29tPiDmlrwgMjAyMeW5tDPmnIgxOOaXpSDpgLHlm5sg5LiL5Y2IMTo0MeWvq+mBk++8mgo+Cj4g
Q2hhbmdlcyBpbiB2NToKPiAgIGZpeCBidWlsZCBlcnJvcgo+Cj4gQ2hhbmdlcyBpbiB2NDoKPiAg
IGFkZCBBdXRob3IgYW5kIGFkZCBwYXRjaCBkZXNjcmlwdGlvbgo+Cj4gUmV4LUJDIENoZW4gKDIp
Ogo+ICAgZHJtL21lZGlhdGVrOiBtdGtfZHBpOiBBZGQgY2hlY2sgZm9yIG1heCBjbG9jayByYXRl
IGluIG1vZGVfdmFsaWQKPiAgIGRybS9tZWRpYXRlazogbXRrX2RwaTogQWRkIGRwaSBjb25maWcg
Zm9yIG10ODE5Mgo+Cj4gIGRyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfZHBpLmMgfCAyNyAr
KysrKysrKysrKysrKysrKysrKysrKysrKysKPiAgMSBmaWxlIGNoYW5nZWQsIDI3IGluc2VydGlv
bnMoKykKPgo+IC0tCj4gMi4xOC4wCj4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCkxpbnV4LW1lZGlhdGVrIG1haWxpbmcgbGlzdApMaW51eC1tZWRpYXRl
a0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4v
bGlzdGluZm8vbGludXgtbWVkaWF0ZWsK
