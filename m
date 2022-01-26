Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DBB60C2BA4C
	for <linux-mediatek@archiver.kernel.org>; Wed, 26 Jan 2022 06:34:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:
	Subject:To:From:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=UTt7cNNrtgIwWt/UnVSkosbxX5JWQWCIRWglyD7ujQk=; b=XdaAUcrGZcNky6
	oDPcCMA/i5qQKs0NyH3TbXlPE0wMWi0jIor9KUZ2XPSqZzaBU4fK/vUxqISwC7fUHwuUH4qfaHk06
	l/FhPE29vUQKF7gRVX/a3astZO6wN3LF+B9FHcVET6YvpkchlJrC0wKIRGurpqkT74ScuEQXDmZX6
	J2ERTHWKCVStTRAvfJd246bP/ExiskRxGu9yI1TteJ5rZpS3mxFqd17Ne+pnrqsD4t6LqeB4ZzCMr
	EW8aH6lSf4zw9ZX5cDqnDyXoOo2d2uNXx1G3EAWoMvqLM4bn0mc7cH99lYCxsM1/SzBNvDKpNAFLU
	f5/ukM2i85v52e8nAfuA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nCbt8-00AIdM-GH; Wed, 26 Jan 2022 06:34:38 +0000
Received: from [165.227.27.25] (helo=box.pce.com.de)
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nCbt5-00AIcp-Jh
 for linux-mediatek@lists.infradead.org; Wed, 26 Jan 2022 06:34:36 +0000
Received: from authenticated-user (box.pce.com.de [165.227.27.25])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by box.pce.com.de (Postfix) with ESMTPSA id C3A615B666
 for <linux-mediatek@lists.infradead.org>; Wed, 26 Jan 2022 13:21:41 +1300 (+13)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=pce.com.de; s=mail;
 t=1643156502; bh=lYQeoDIqYYNj0lU5SFQwOoe/qWrpOMLSuuqh1lBn2kQ=;
 h=Reply-To:From:To:Subject:Date:From;
 b=AdrFaVxbfuj+pOgxZd3N3GPv9AYhGipQmmAb5DqhOZicFvmz3F4WrU5zmcvqQA1tU
 U5z4HbR9tvR50Klh+aHi6ripK+hTE7LN3wzjbhkvFN/6yHM3okX+gETKwdQjBOyZ9B
 0QsfqCcokhn8nSRu2Ibk9XN95GzxPXwjM09kNwOh6pxnbnJgAyrx6As5zNUDofGvpp
 1LRgRaWi+zJDaI3dYI1c7Meiu8Kh4kbvuzlN1bgIR6ZHetXtFqODwcgymSZYopr1U1
 Tzzb8LogQ53vdlmLyj6hJa828oDcqgPIbGPTMn1OSOAAP/+tUUDA1mwjYxfbCJZRzG
 zwfB1x53C7EBw==
From: "Dr. Simon Brayshaw" <info1@pce.com.de>
To: linux-mediatek@lists.infradead.org
Subject: Supply Proposal
Date: 25 Jan 2022 16:21:41 -0800
Message-ID: <20220125161423.E5893FB2ACBADDA5@pce.com.de>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220125_223435_666312_1E8B04BE 
X-CRM114-Status: UNSURE (  -0.20  )
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
Reply-To: simonbrayshaw@sbresearcher.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Hello,

Greetings to you! My name is Dr Simon Brayshaw. I am a Research 
assistant of the Research and Development Department working with 
ANTIGA PHARMA, One of the leading Bio Pharmaceutical Companies in 
United Kingdom. I'm looking for a reliable businessman/individual 
in your region to represent my company in sourcing some of our 
basic raw material used in the manufacturing of high quality 
Anti-Viral Vaccines, Cancer treatment and other lifesaving 
Pharmaceutical Products.

This may not be your area of specialization but it will be 
another income generating business out of your specialty. This is 
because our company is yet to locate any seller to buy from. 
However, I have been able to discover a local dealer who can 
supply us this product at a cheaper rate.

THIS IS MY PROPOSAL TO YOU; I want you to stand in as a supplier 
of the herbal extracts. The reason for this is because I don't 
want my company to have direct contact with the local organic 
farmer that sells this herbal oil extracts at a cheap rate. This 
will enable us to work together as partners and make real cool 
profits. You as the local seller will supply our company at a 
good rate which I will inform you how to go about it later when 
we are in agreement. You will be amazed with what we can achieve 
together.

I will give you more specific profit details when I receive 
feedback from you if you are interested.

Regards,

Dr Simon Brayshaw

Research & Dev Dept
ANTIGA PHARMA

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
