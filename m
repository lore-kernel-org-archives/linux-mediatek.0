Return-Path: <SRS0=QBiq=PI=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F3820C433EF
	for <linux-mediatek@archiver.kernel.org>; Wed, 20 Oct 2021 22:29:38 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9BB0F611EF
	for <linux-mediatek@archiver.kernel.org>; Wed, 20 Oct 2021 22:29:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 9BB0F611EF
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Mime-Version:References:In-Reply-To:
	Message-Id:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=n1YYVE6mSQ1PsiCxV+cx/2Qwjvd8+92AV2lrCULVywI=; b=UqaIURKWN5+9H3
	Ov4InnvtzebNyC7Nay/0XnRzfN4E5GKe3u0+YhLkpTUWxA7RgRJk75p1ib1H72cLE/qMmYogeJH/6
	BHNvXFjXN06QRu8fVAuPntcTjJY5vsrKYWYgf1D7LVGksuSEhWxD4/yjrL7tSLGtnWp7jHx8VrcOQ
	KgNAb/dc+1jh7RHovs9zIqSHJ6ZzsyzpG1V3iyBxy0weoUEfmaihL2cLvjN0ByGjTWqFB1Kmi5e/d
	SnNlIoqVmWYKEzaacAbQPc4BLLgkeuVIBvhfljYNeZdQGK2IWK7m7cjMrL0kEuid/0rCJGRsd4YUL
	+KFDQH2R7Zxv6pe4LAgw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mdK5N-005v1y-24; Wed, 20 Oct 2021 22:29:25 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mdK5B-005v0d-LD; Wed, 20 Oct 2021 22:29:15 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id F36716056B;
 Wed, 20 Oct 2021 22:29:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux-foundation.org;
 s=korg; t=1634768952;
 bh=jRHi18PfO4NBozNbrNBvNRggK2ZyxPV2M2RhSxhsXMU=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=TEnlDxKO4pPNEPA8gMkZMBGcRHi0pPKo1l5f/n3ejSwPQs+QQF0oFWcxHlefY//GH
 rcg/twsI8uuY/cEonHRFx/BIrlhZwfaRvfZ4tVriO9cpl1MDkAnQD2HW/bPFKh3Fpd
 xuNvX08dOoJlR76MvWo/YNj6TrqKypUwXxEFUdmo=
Date: Wed, 20 Oct 2021 15:29:09 -0700
From: Andrew Morton <akpm@linux-foundation.org>
To: Marco Elver <elver@google.com>
Cc: Kuan-Ying Lee <Kuan-Ying.Lee@mediatek.com>, Andrey Ryabinin
 <ryabinin.a.a@gmail.com>, Alexander Potapenko <glider@google.com>, Andrey
 Konovalov <andreyknvl@gmail.com>, Dmitry Vyukov <dvyukov@google.com>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, chinwen.chang@mediatek.com,
 yee.lee@mediatek.com, nicholas.tang@mediatek.com,
 kasan-dev@googlegroups.com, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-mm@kvack.org,
 linux-mediatek@lists.infradead.org
Subject: Re: [PATCH v3] kasan: add kasan mode messages when kasan init
Message-Id: <20211020152909.2ea34f8f0c0d70d8b245b234@linux-foundation.org>
In-Reply-To: <CANpmjNMk-2pfBjD3ak9hto+xAFExuG+Pc-_vQRa6DSS=9-=WUg@mail.gmail.com>
References: <20211020094850.4113-1-Kuan-Ying.Lee@mediatek.com>
 <CANpmjNMk-2pfBjD3ak9hto+xAFExuG+Pc-_vQRa6DSS=9-=WUg@mail.gmail.com>
X-Mailer: Sylpheed 3.5.1 (GTK+ 2.24.31; x86_64-pc-linux-gnu)
Mime-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211020_152913_752645_BB640061 
X-CRM114-Status: GOOD (  14.86  )
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

On Wed, 20 Oct 2021 11:58:26 +0200 Marco Elver <elver@google.com> wrote:

> On Wed, 20 Oct 2021 at 11:48, Kuan-Ying Lee <Kuan-Ying.Lee@mediatek.com> wrote:
> >
> > There are multiple kasan modes. It makes sense that we add some messages
> > to know which kasan mode is when booting up. see [1].
> >
> > Link: https://bugzilla.kernel.org/show_bug.cgi?id=212195 [1]
> > Signed-off-by: Kuan-Ying Lee <Kuan-Ying.Lee@mediatek.com>
> 
> Reviewed-by: Marco Elver <elver@google.com>
> 
> Thank you.
> 
> Because this is rebased on the changes in the arm64 tree, and also
> touches arch/arm64, it probably has to go through the arm64 tree.

That would be OK, as long as it doesn't also have dependencies on
pending changes elsewhere in the -mm tree.

To solve both potential problems, I've queued it in -mm's
post-linux-next section, so it gets sent to Linus after both -mm and
arm have merged up.


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
