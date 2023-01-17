Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E0C66C63797
	for <linux-mediatek@archiver.kernel.org>; Tue, 17 Jan 2023 13:52:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Subject:To:From:MIME-Version:Date:Message-ID:Reply-To:Cc:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=vgjmjcKuXP3RoqqniCwReaFJ8sbKhLTf3w6njJyfS3U=; b=Xpai+IzwBr8weDGS9UOKPbtItp
	mwVsZRKsJ5SKFbJNuPzCy+rlAIHOXL3svwKZOdWnenWub3Hhh6W69ttu5NpOPPPIE005YIqUAJS18
	S/ro1HVPWlPbrXRTEJ520T+h1LgmdtbHJIykyp5lK+m5jrG5RoERj3OI73ZpS99b5Sv7tLjLVnBpM
	f0yFqaEdROqHZ/DmvgUSML2QRHCb7pQ6/2tbPPleKjMy4OJg1szCnKtTA+wGRnfv33PdPFjAmAlDD
	+kcLOIFe0bcgV1cLxrE054ZSIOmVaVxz5CJ0PTDI3v1o5xEqORePCLsadtjaN38xH+hPfLYK1c4JK
	UaGgU3Zw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pHmNY-00ETUi-6u; Tue, 17 Jan 2023 13:51:56 +0000
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pHmN0-00ETJ5-Sq
	for linux-mediatek@lists.infradead.org; Tue, 17 Jan 2023 13:51:25 +0000
Received: by mail-wr1-x42f.google.com with SMTP id d2so10519356wrp.8
        for <linux-mediatek@lists.infradead.org>; Tue, 17 Jan 2023 05:51:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:subject:to:from:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=vgjmjcKuXP3RoqqniCwReaFJ8sbKhLTf3w6njJyfS3U=;
        b=YAG1uRaqtgDqVmRAAA7CmSQFyBvkUJRr+PGzxcda44vL8c5IVl/NZ7T2YRwQ7BeqCO
         wbWkpvDXfAvHeAvYxunxRGS/OhM33Oj1jawbxIvALZWDLUh+VlwQ7rA/allcbI76LYhf
         YFbo9duRJ1GPpkr0APIyTgL8mqHujK4YR8kz0exs1PLAsXay8ZALGtfm3jHB76vAVfyu
         MhLI7rYKOwVigX6wF6rQ6YNErdfsJ/JbPrWbqEeaxHmorvhEwJRlhL5NryyEkVWIuFjs
         1jkBMlDaN93epFefkanDddYu/tDQoxssXzNDJJmzMlY/jSMaNz5+wyqxH+6gGfN+S1or
         pOVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:subject:to:from:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vgjmjcKuXP3RoqqniCwReaFJ8sbKhLTf3w6njJyfS3U=;
        b=PLynAwwjlaz9dyxpbPK/+n7iPQFEg6FQcfBAzaMiAeVAwozqoEd5oW565wM6MQ7xUW
         uygkWYa9a0hAaCqI8kLv+moFeClA3YyTuMji1qt24MTsfA8xreGZi1WzZFN03fFnWVcl
         VrxWR971giNc6dMdn8EODXDHUA7ElAH+i4iM9nY7Rje7gYIcDAt7dOqkFFhuBwb1ADhF
         DVzC9dGbE+b6TfR+55nW/jkyXFkvLIt873tnpKvYyiDx/UYbUC8vSNI6+otXSTebawOS
         a+ZfFlYymcWQvv9bbPS5Orxftjftmb8G42pi9ojdfC8Pwbu2Eh/hRGarO78qANi5BFgS
         sGFg==
X-Gm-Message-State: AFqh2krr5XpdJ72qvIER/BHRvXhA2VfdE67Q89B6EXXdvpf6sPdyDa5A
	XDw/RecHDTAHvprNIX69WqBbZI5Mq34=
X-Google-Smtp-Source: AMrXdXvYdfo+hFeCtJ1eP1cNZ5pQ4yyr8gbaq3Masx7f3nVAxkOvtuVP7cNe9x57Z3ItH57wL2TX8w==
X-Received: by 2002:a5d:6988:0:b0:2bd:f18d:e909 with SMTP id g8-20020a5d6988000000b002bdf18de909mr2888588wru.1.1673963478360;
        Tue, 17 Jan 2023 05:51:18 -0800 (PST)
Received: from DESKTOP-53HLT22 ([39.42.178.198])
        by smtp.gmail.com with ESMTPSA id f2-20020adff982000000b002bde537721dsm10900971wrr.20.2023.01.17.05.51.16
        for <linux-mediatek@lists.infradead.org>
        (version=TLS1 cipher=ECDHE-ECDSA-AES128-SHA bits=128/128);
        Tue, 17 Jan 2023 05:51:17 -0800 (PST)
Message-ID: <63c6a7d5.df0a0220.526d9.481b@mx.google.com>
Date: Tue, 17 Jan 2023 05:51:17 -0800 (PST)
X-Google-Original-Date: 17 Jan 2023 08:52:52 -0500
MIME-Version: 1.0
From: archiefederico530@gmail.com
To: linux-mediatek@lists.infradead.org
Subject: Any Drawings for Estimate?
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230117_055122_964273_6A1EBBFC 
X-CRM114-Status: UNSURE (   4.87  )
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

=0D=0AHi,=0D=0A=0D=0ADo you have any estimating projects for us=0D=0A=
=0D=0AIf you are holding a project, please send over the plans in=
 PDF format for getting a firm quote on your project.=0D=0A=0D=0A=
Let me know if you have any questions or if you would like to see=
 some samples.=0D=0A=0D=0AWe will be happy to answer any question=
s you have. Thank you=0D=0A=0D=0ARegards,=0D=0AArchie Federico=0D=0A=
Crossland Estimation, INC


