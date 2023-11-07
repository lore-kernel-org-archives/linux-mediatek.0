Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D183C4332F
	for <linux-mediatek@archiver.kernel.org>; Tue,  7 Nov 2023 22:58:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:To:Subject:
	Message-ID:Date:From:MIME-Version:Reply-To:Cc:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=g3zLYH4xKxcPrHOD18z9YfpQcnk/GaJedfustWU5uGs=; b=oVlLvaUWFecYJ2R9aDBWdQwmRp
	U9ItpbTWVkB9qxolAW8HGCzfYUC4aQ2ZdYdBVMpnTaWl7gY7Z6j4c3Tpd5jpIELzA3s1slbAflC2a
	4s6khE4Z+6rZ2kSSvJ6H2rOnIIkYeuRQ6nxoGvbkej2SXYUFYZEGXUdb+AXnI3iAoVf6q6lt2DEza
	izjQWO021U9f5d78NBViHIcRy8gDL+a7XTvWwktjNlT9KPdnoMw7hKEriJ9QWmnogUdii5gfqv+63
	s5/xWRmK6dHa0ZgOlLiw2BdLHlO6B2GDW3yOTkSWd7W2yvH1sN+PBRbaBQ7FhsqpOlcUxYbouYcIr
	XYmv9TOA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r0V1R-002ZRq-2d;
	Tue, 07 Nov 2023 22:58:13 +0000
Received: from mail-ej1-x633.google.com ([2a00:1450:4864:20::633])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r0V1P-002ZRH-1D
	for linux-mediatek@lists.infradead.org;
	Tue, 07 Nov 2023 22:58:12 +0000
Received: by mail-ej1-x633.google.com with SMTP id a640c23a62f3a-9e1021dbd28so386903066b.3
        for <linux-mediatek@lists.infradead.org>; Tue, 07 Nov 2023 14:58:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1699397887; x=1700002687; darn=lists.infradead.org;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=g3zLYH4xKxcPrHOD18z9YfpQcnk/GaJedfustWU5uGs=;
        b=X+/pflhORLuIjEsMhMFv9F4eN4pfvWOr8PUZu/xMVbWDNoYj9RZkdQejJr6eSXbpBB
         qQdMkUVgXXUHs8ECFrLyQM0qBmwX44uiEo9G1HwhTVi4xNLKHyve+R7wbug35rSaJMrQ
         C7LbUbSPwka4612Or66STYNhku6JCuiyguRw4gyap0cPcAJeL2eyR8AKEXRJxLLvwk6y
         GIv8YxQEsYCjQY8hwISjeK7huSDj/2ncH2lQNY1ZJ1kkAHd1tuRF+0AWtE+NY+qn8ihn
         pcbCZ3LP4eOtdxL6iH9FO4Fn2tdY+toGmADVuwPQ2y/5DNA5TK6kBdGEyT+yXR4+q+uX
         3K3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699397887; x=1700002687;
        h=to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=g3zLYH4xKxcPrHOD18z9YfpQcnk/GaJedfustWU5uGs=;
        b=QKLQ6yBd/fz9cpSvMm0XDeDF5/Pbw5gPMsS/UXqGRUbn1rXm0uwjnjsZYWPBT2vNS9
         FHvnJ9zVCyoGzO87GxPgO5gkXCs8EOIoUahke27pcY6A7fhPTcqLGuFtlyyO+CwBi/xC
         oI+Vzi4hai8Oc5RHyl8VVCTSDK7bkjIrMj6xvjcbqGDCk/lPnlfsDwfTKfyD97xvF2k+
         KpT9Ao+eKw9ceAJsfkEYZOAipJW4RkZrInw+TS+fV2hwiTLuWIYp+K+k1e3dR/0fPw5u
         ZUebAPiMA2WggENRhT3g0Ie6HcszUiW984PtZwHHxH5wo0N5Mupp6UDVrigu7s8p/oAV
         xvWg==
X-Gm-Message-State: AOJu0YxIiWuTPMABo4yI3E2akSsveR72HTo5ZbVzRi/33RAtMIW0xjBJ
	GTpn86KL7ZKTxPOXrLXdfvps4VkDy0ZpmEZ0nws/5oNC
X-Google-Smtp-Source: AGHT+IGobzZ1ZFp/DT+a5gPckJevYGjfjN4iPb8niHpEjr1sl1wACUC8VsLyXrrhP/Fh2TNdCLxwh3sPNLMdGkB5KZA=
X-Received: by 2002:a17:907:a089:b0:9b2:b269:d563 with SMTP id
 hu9-20020a170907a08900b009b2b269d563mr25023ejc.63.1699397886837; Tue, 07 Nov
 2023 14:58:06 -0800 (PST)
MIME-Version: 1.0
From: James Dutton <james.dutton@gmail.com>
Date: Tue, 7 Nov 2023 22:57:30 +0000
Message-ID: <CAAMvbhGVUmscj2c=vyA6KojtRb_03pFdcd8yH-AVS3UZESSVog@mail.gmail.com>
Subject: test
To: linux-mediatek@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231107_145811_416419_13CB2BA1 
X-CRM114-Status: UNSURE (   1.88  )
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

test

