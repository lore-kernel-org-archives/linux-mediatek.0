Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD161C433F5
	for <linux-mediatek@archiver.kernel.org>; Thu,  2 Dec 2021 11:00:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7Gmgd/fiJFolR5TVN/CAw8clvP57UyqvxL498bL5rK4=; b=5B4ZN/06TgyKdK
	iRTeZIeULANdmJJxBmtSbn+0DKwpbpUloAiENha0ZRVt7hCJk7Td1BAz1ha0r4/DmFXhqfTo5NJWp
	dsqOaXtrKsMcnKeXSp7anG7NxlD/Ihx3B6g4zgfN1FnjsXaPAr5UtO/W23Kd9OE1JSSt1hbE1Ltxz
	nNz6SnKkgdlrtB+Y3+urwM9XY/0KAaACDtZ+N1FnaFyCYqp42zlWq7xcNGvc2RS3oGDBCCXbRYqRT
	MQYMcJywnAQEhWoQuvNed1X0yHq1+4qn/aD+ruxXylSI7VbD6bsP8+YbMjndiLq2+TFnuQNlYKXdP
	JeZ8IyDjYY2F2baNMHlg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1msjof-00BuTc-Un; Thu, 02 Dec 2021 10:59:53 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1msjoM-00BuMX-Vd; Thu, 02 Dec 2021 10:59:36 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id ABA58B82297;
 Thu,  2 Dec 2021 10:59:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CFFD0C00446;
 Thu,  2 Dec 2021 10:59:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1638442772;
 bh=jfJ+kzNVnJ1CTqytb0LMULYzG8eo4xvWqb8+ZuhmIbI=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=eSoR8ZLGUZRvLgk4QuK02OG5qkshTYKJ0vjIPsSe0WgHkDiqX4UwRL9IC95D8VDRl
 qMaFwvXSpzedLDw+YHJEymEE3CKHhiI5ec3wp8XXz8DDRfaDoDKMAU0dj7xR14NMJm
 tQgGxbfOmWN/oAQ+QyDWGEneGt5Na3zACyV+s7BaeyENWwkVJ6QNuaPT00QriZ0gqy
 e4Ke/6hW9/EGr77hoO7C0u6A2Z3q5EbAbJ/8W82h8RnH3iezOI9ZB17fZnBVPxVWNT
 n/+pgQtB4O1gW9P10VhFjPzYNZhF46ESWbnaUJQqGFSAJyaQOONvOnBN1QsKkPxTB+
 UBJOhnDIgLsvg==
From: Will Deacon <will@kernel.org>
To: Catalin Marinas <catalin.marinas@arm.com>,
 Mark Rutland <mark.rutland@arm.com>, Jonathan Corbet <corbet@lwn.net>,
 Kuan-Ying Lee <Kuan-Ying.Lee@mediatek.com>,
 Matthias Brugger <matthias.bgg@gmail.com>
Cc: kernel-team@android.com, Will Deacon <will@kernel.org>,
 nicholas.tang@mediatek.com, linux-kernel@vger.kernel.org,
 chinwen.chang@mediatek.com, james.hsu@mediatek.com,
 linux-doc@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org
Subject: Re: [PATCH v2] arm64: update PAC description for kernel
Date: Thu,  2 Dec 2021 10:59:24 +0000
Message-Id: <163844001555.25175.12332583693685528592.b4-ty@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20211201034014.20048-1-Kuan-Ying.Lee@mediatek.com>
References: <20211201034014.20048-1-Kuan-Ying.Lee@mediatek.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211202_025935_186988_59C3C530 
X-CRM114-Status: UNSURE (   9.74  )
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

On Wed, 1 Dec 2021 11:40:10 +0800, Kuan-Ying Lee wrote:
> Remove the paragraph which has nothing to do with the kernel and
> add PAC description related to kernel.
> 
> 

Applied to arm64 (for-next/fixes), thanks!

[1/1] arm64: update PAC description for kernel
      https://git.kernel.org/arm64/c/ce39d473d1ed

Cheers,
-- 
Will

https://fixes.arm64.dev
https://next.arm64.dev
https://will.arm64.dev

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
