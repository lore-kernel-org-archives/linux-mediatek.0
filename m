Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3EAD7E67803
	for <linux-mediatek@archiver.kernel.org>; Mon, 22 Dec 2025 18:09:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:In-Reply-To:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/MPZ0+lXn26JACnK/1Bt2AJSyVQiGzIeO7aL1qutLK8=; b=PJwdMdSnEeDmJOWK78m/g7+7T3
	VWu5Ii+xJaUcniYfFjoe0ru+kVlJJfyfR155NeLpSJojntH4TXbj0L9kC/E6Fmyc5osafqaE0QkBs
	PsORDmcPE8vEjOXi2IPmY8kmOZLsqs9IZ+YVpTX5Qg4g1knPyy6Bq/7XzH7irotwQdzKwuFuJrb6a
	0msx/QlSAI8vaRercBnVwwBbE3JVA5LKRd0sMAzIa9qi2+8w1pt6Ex96QVMXnvggbGwKB6thMAFCd
	FAK9UlDAt2lp7ZC0P9JnrCLKMYE9l/if7HYqT4BEGzBqCNRXq8k4qktnsAMdM8dIOGBlreO2sQ69z
	67Gz3jSg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vXkLw-0000000E3EI-1jYc;
	Mon, 22 Dec 2025 18:09:52 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vXkLu-0000000E3DM-0Sfs
	for linux-mediatek@lists.infradead.org;
	Mon, 22 Dec 2025 18:09:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1766426989;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=/MPZ0+lXn26JACnK/1Bt2AJSyVQiGzIeO7aL1qutLK8=;
	b=BChp5nIGbDPiLPCYJtSkw0TNY2m4MfBwArhZ4QFPO9/j1D+Pjm7dL+fRSMMe/OIBi4FEBQ
	gClsmwzknU6SMfEd1bu6eB0ogWljM6YG9QiG9uEldGY/yiqCmqsah5GJ5UF12YYfTWmlet
	BKghB93ikdBodusgl12jULqfEaMS4Wk=
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-83-MFRy-5XrPJuWekfUNlKfhQ-1; Mon, 22 Dec 2025 13:09:47 -0500
X-MC-Unique: MFRy-5XrPJuWekfUNlKfhQ-1
X-Mimecast-MFC-AGG-ID: MFRy-5XrPJuWekfUNlKfhQ_1766426986
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-4ee3dfe072dso109128461cf.2
        for <linux-mediatek@lists.infradead.org>; Mon, 22 Dec 2025 10:09:46 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766426986; x=1767031786;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=/MPZ0+lXn26JACnK/1Bt2AJSyVQiGzIeO7aL1qutLK8=;
        b=w3Lv/SMXRr4INdOeDRKGy7CMojngAzE239mNSepfZCwi2wsgHGU4KCVUphTse8/5v/
         0l+zGZfTLTJyJsmXnWj3G5p1rlZqA3srdriYkipy3CDvdlJJmRa3reyb2KMHICH/YqHS
         CielSU4w7U8Pf9NHzCSpFEKMIyq1ekE1OuPxOX8JTgzR2CR+I9TIb9AHcEiPXZ0oNxDt
         So0+ZdaSIQc6vHSZiXkNSTTaL95pa+zFOaBqrKlJoh6S+QkZaEmdEx1si8Sln22LfB+H
         5fVMjgAD2XLyXLS9bOrl3tjVUkcatoc3o4FWQe38PxQ9K9hIJlrsIycZjFZlqZoHbwhX
         sWRA==
X-Forwarded-Encrypted: i=1; AJvYcCUf3NvsDcqYL9cBtLtFCPipVNm6NLbKUWRzlTIg9QykIsZKVCzOgVyKU2IPbHzwXDKMY00LsUqy0wQQRCi6QA==@lists.infradead.org
X-Gm-Message-State: AOJu0Yy05OcZRMgOvKyL/pxzvGMdTgcSJhTJs8/Rlcvapk0S+sOFvchq
	8Zz901Tw1Udzs3xgQJvLiP5PMQ4vmvL8RhosEZp9zA9h9kA12E6DJuziZFZijYI6SgneiFQPh+c
	OFH3sPfS3vj01Luj/QzScOrX9WOCj2jT+hn4tkZlYD2wYAivcIs581Z5QCctz06QAeB48naEu5A
	==
X-Gm-Gg: AY/fxX75Z5Sj9X5Cz0SUDZnluzbrg6IR/k0x1jpNhG/pTDcGtC+Hlf3CX/ZfTGHqc0q
	qEGj01LJ4Y1e9Ae/YMLR/1bkaOk1RwEUgEufvG0kJkQT+CktXXlzTUddUwCALI16zkz81Kn7TOi
	Ir6fs1dsJ+sciYgQa/6HVA4pZmD7JDCjIqDM9SDpzhOwBRF7bzvAtXrvVS7moAu/CQBIKFXR501
	EBLFg2QJyr0YYb1BY0L6J7eBaY4oubiEF+frRVB+cNh+3EDJY27aE0T0DSPjUJBmynt1i2CnDg3
	gwZyOlb+Omm8zY9h4VESQHzM5HSQycI6pnC3nFCgNQnBkDEzBtORF/c8ZpW6cHf9uU5jcK+sSpy
	wWXS5rklfHuxOLiHQg8gXo7Svs9DxyKqitHxbt7PDg+e5
X-Received: by 2002:a05:622a:11cb:b0:4eb:a192:de99 with SMTP id d75a77b69052e-4f4abdc6a37mr166817991cf.76.1766426986164;
        Mon, 22 Dec 2025 10:09:46 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHhen4inuPei2QtIgz1Jhp7TuWhSfPiBiWyK9QaTxuqDdPYVrS4RnzupTyJuPkfHzkoEa0TrQ==
X-Received: by 2002:a05:622a:11cb:b0:4eb:a192:de99 with SMTP id d75a77b69052e-4f4abdc6a37mr166817461cf.76.1766426985756;
        Mon, 22 Dec 2025 10:09:45 -0800 (PST)
Received: from redhat.com (c-73-183-52-120.hsd1.pa.comcast.net. [73.183.52.120])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-88d99d7a08asm89568916d6.38.2025.12.22.10.09.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Dec 2025 10:09:45 -0800 (PST)
Date: Mon, 22 Dec 2025 13:09:43 -0500
From: Brian Masney <bmasney@redhat.com>
To: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Cc: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH] clk: mediatek: don't select clk-mt8192 for all ARM64
 builds
Message-ID: <aUmJZ7o6PpWeXFZP@redhat.com>
References: <20251222150235.34919-1-bartosz.golaszewski@oss.qualcomm.com>
MIME-Version: 1.0
In-Reply-To: <20251222150235.34919-1-bartosz.golaszewski@oss.qualcomm.com>
User-Agent: Mutt/2.2.14 (2025-02-20)
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: casexfPeWLN9PTrtnOCO6Am4CRHCZXGKDxiu7W6JSkU_1766426986
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251222_100950_237083_56BA0D0B 
X-CRM114-Status: UNSURE (   9.36  )
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

On Mon, Dec 22, 2025 at 04:02:35PM +0100, Bartosz Golaszewski wrote:
> This option defaults to y for ARCH64 meaning it's built even if we don't
> want anything related to mediatek. Make the default condition stricter
> and only build it if ARCH_MEDIATEK is selected.
> 
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

Reviewed-by: Brian Masney <bmasney@redhat.com>


