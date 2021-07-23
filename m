Return-Path: <SRS0=Y38d=MP=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C4803C4320E
	for <linux-mediatek@archiver.kernel.org>; Fri, 23 Jul 2021 13:46:35 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8DE4860F02
	for <linux-mediatek@archiver.kernel.org>; Fri, 23 Jul 2021 13:46:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 8DE4860F02
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=public-files.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:From:CC:To:Subject
	:MIME-Version:References:In-Reply-To:Date:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=vYTKGIXuO9CSTgtW5xTzfMD7ZQoQ8nkeNQILhgChvJQ=; b=X3ge7CC4nwKJ4M
	RHSGhK+5i+8MfrAtF+/qDUgp4P2borVCO1cdrgz/fGfVdEpVqOCFuMqJ8xisXy2VsArp9SYRh6eIT
	8qGY/yexJcJC0btRgnBtQlFewekG/C3EyYEdEFAlXPUv6JBEzwNwTsTd2bnJuOhyKwkCzaeK4kpZS
	wuMLKFTBewur8HgsfpqTMxX+fs3t6UfFJJ+mVtyv+1xxqvUPNye5Hy3LVltQlz2BZlHuDpeZPQN3F
	wVKhgNB+sqJclDYNMXRODdm7zOyQE/k9qoFQ1J+JRkeJA5DXx7B7UFLwxhaAKdwSaQJt6E/cYpKIb
	W7++qGkl6lW4IZ4TtEFA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m6vVO-004u4R-Kf; Fri, 23 Jul 2021 13:46:22 +0000
Received: from mout.gmx.net ([212.227.15.18])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m6vVM-004u2N-3p; Fri, 23 Jul 2021 13:46:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1627047967;
 bh=uOVWPoV+0COS1ebm/CTCvdHxMf0SfnJuHXMIargNVL0=;
 h=X-UI-Sender-Class:Date:In-Reply-To:References:Subject:Reply-to:To:
 CC:From;
 b=aPHbf+xJ1KxStTo6yeuHU9FIsQmVYlMygx9eTy/lWxaQz/dkRb+csx2vne5uMe4oY
 wIqh9pqb5+UUcx3wbbBuCrdmTXRektn+m9wG9wmUgMkFXznhNuRMiFLIpLgFgFJ0ye
 3LvfQxSoWagdr+dimu5theYh7SfG1HUFJ5ZlD1Gc=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from frank-s9 ([157.180.225.23]) by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MIMfW-1lusod2JfA-00EK3z; Fri, 23
 Jul 2021 15:46:07 +0200
Date: Fri, 23 Jul 2021 15:46:02 +0200
User-Agent: K-9 Mail for Android
In-Reply-To: <162608669457.4543.2374973099687363958.b4-ty@kernel.org>
References: <20210706121609.680534-1-linux@fw-web.de>
 <162608669457.4543.2374973099687363958.b4-ty@kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH] spi: mediatek: fix fifo rx mode
To: linux-mediatek@lists.infradead.org, Mark Brown <broonie@kernel.org>,
 Frank Wunderlich <linux@fw-web.de>
CC: linux-arm-kernel@lists.infradead.org, Leilk Liu <leilk.liu@mediatek.com>,
 linux-kernel@vger.kernel.org, Matthias Brugger <matthias.bgg@gmail.com>,
 Peter Hess <peter.hess@ph-home.de>, linux-spi@vger.kernel.org
From: Frank Wunderlich <frank-w@public-files.de>
Message-ID: <363C87CD-F0C6-4A46-877C-86E07D14787D@public-files.de>
X-Provags-ID: V03:K1:dZfvZWxqxCmhDGOcOppaRh1/0B9ez7nDj/olxCAjAF0eeXmOZfS
 ZRu5+cbCocF31onn+8vNjXxIZ9zb/IiTtjtxpvxrkR8lpdo+az1kVokB0SHlid8ear3IFd4
 ri7OgVx8sAWkCogEgnd7HlG83y90URWfz87/PSeGwYF2Za1If/4WpBzKvYtEWL3wFX6VMUf
 ckChCP3vcqP5kCP2mnyDQ==
X-UI-Out-Filterresults: notjunk:1;V03:K0:stqKK/Xd/L0=:piszGl6K2a+xGIZxVsOsYi
 RHbRVNglDVIYZQZJd7R96OCkI4JgKkJxmXUNrK5LXvwrHRTyo4VoHTEEL34HxYj6hLRjnGIRq
 PkF9t8U6ngAKSKSxcbrnYoNJtbimGxmJkrRccHC9oDXD3zKY3YeSanLVhXDGIpt+poCxasYxI
 2IbDGejnp8UHK01fle62S8eXHtvZAhZ5dEm76hegTM5D8lUMIrvvZkD8jGEGXwxJdx0X387NV
 //6NAJBLHAAsZ+eV3NyJyAhwth24ORZGyHJWaY2ft1itZLEi8z1do3NzoV3foQ5+ENrpjVbFr
 NtnrVikK70h1WBQZoqwrGekYz89zKdcDK9+NrMwcQqlIxcVxyD3lUTsIZ57bvD0HxoyCHPFyQ
 V4ftcZjY+yhXgr8G9jC3k8CVBpny2iExVQXX3NdWECEMVsTjtPPvKiNeHP/R6OlDxx655rY1h
 Yc+/uMnhUwu2NG4WyQ7OHT/Dj1Ab9FlH3zIbrTz1cGaaMbKv63uSw9TVRXwopVFrjleZUp2Ub
 NX6hXv3R0Xfj9lQf79osB2PpvOIjUqLj9TttPNs+9sJMJsJE2WR0jX5mhgq3Ha39uAC6L8YZ/
 QqcH2SQhyGbb0rs/QE5WMIXlWyOnV8lhfzPaCSJCc16992GJ8bi7SLePRetMQZZDdLkLj/jfE
 IT4LwmmSogSErnBJn2k6IZO8FfTrYuSavaCyEBRZv4fVO1/QODgQeiPyVE3z+a2eCdz7FkJfm
 fvj9Ym+P6Q4P7VOg+8dgSYGWQbpclCsm9DUAv5ctPDNwhGsA+wmTzUor/nwHVWtKVjUDFMOH0
 IKepA0N4StjHUhXB3CGrqtD0KGhdidjFFM/qKhTvEbuLEMIU3b+4RpMyQTIArSB6mDUOm/XtS
 511X5e3kAYE8JA11M3hbe6EX4H7tQj1iaz//6ZKrJw4iYx/nGNF2QSEqdrSWZ2i7f5sU+ULG9
 EypiNUkOnheFshvAsdrUp64PEjVsdpfx1Iupn1jEbBqEz3CBXnxw42uAB7DBnjCDb4VH0g7pt
 zoWu4BZmkCTmuQ6by6WInWgXjSi+otMbayhbj7fp5dTO1CGzUZWboYNaENQub0rMl5rcNf4Zk
 T0DeQ8Yx9rWzMYNqw/rZisY+tjYPXmftXZ2bgRMNyrM6ewRvGX2tKCnxg==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210723_064620_490831_17AB614E 
X-CRM114-Status: UNSURE (   5.80  )
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
Reply-To: frank-w@public-files.de
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Hi

Can we add stable-tag i've missed to fix older kernel versions or inform greg to add patch to at least 5.4/5.10?

Regards Frank

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
