Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 336B7C25B48
	for <linux-mediatek@archiver.kernel.org>; Thu, 26 Oct 2023 22:26:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=k5p4Mh/OXx/If7dQQRvDkjUM/vaepawDRdGrZy7iw80=; b=WRv8+BzxY1mpFsBR983OOIhIFs
	oA9soNVjsQDL9uJoknhFpYDxhAYC5g03cd4Un/y2D/gEZFnYAAQNhAqwWGUcT5daNwPOxK+bdJynY
	ils3mYjo49O+GnxDOEhq9NgcB5Th6XGaftJB0bpYnV1SG+l2LYisP6XUjBY4WIDFuoVqsdOcSxfSp
	Mev7MezBi6V2xcUCRdlKsEkT8qRG66DgH8G4kCfV7qgkJ+PMtPvAes88sknsiKNGv7s4rdoso70YV
	Z/jKGxoa33k3b+oZQ12Ymx5CKZfjMLep+Ixwk3HcKavz8VPm/hWXsHmv00grIdlDq3mMIZOaWTbEc
	2joVwIDg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qw8nl-00FFgy-0a;
	Thu, 26 Oct 2023 22:26:05 +0000
Received: from mail-lj1-x232.google.com ([2a00:1450:4864:20::232])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qw8nc-00FFeF-1P;
	Thu, 26 Oct 2023 22:25:57 +0000
Received: by mail-lj1-x232.google.com with SMTP id 38308e7fff4ca-2c59a4dcdacso23957081fa.1;
        Thu, 26 Oct 2023 15:25:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1698359152; x=1698963952; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=k5p4Mh/OXx/If7dQQRvDkjUM/vaepawDRdGrZy7iw80=;
        b=Ni9wLCyWcrRCoFVWWwuNQmgR2ldfvkvdACInrpyUbQq7uo8UOnSlIsObkhFp3w+qk+
         83O4uTjmTZ27w5UjdSRmTca8oGXBetfzhT82HTXeNEfSIgUOUL46XKyFG4RJZ+mU4Jel
         YJ9BHHbkY446p+mYUgYJaFrXw8PkiXaFsKcfs9Gs2wP4cRKyD5fzM44egUcfeCEb8UHK
         p59C+dyR0N8RLs9MKAhR7wA1u593a8ifQN4yKOEs/Kt3xBt/UdGj5HpjUOJ8eRMjBWnq
         ZOoBjvHbvXT+HMXAPCjP3fYzSUO35T/jLfC7GvtiJ9RzmEip3BrlDflLIyFsqfIciz0a
         zdow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698359152; x=1698963952;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=k5p4Mh/OXx/If7dQQRvDkjUM/vaepawDRdGrZy7iw80=;
        b=eD112jY/1z0FXspD3bnFelSuC0ES4Qc5QR/JvBzKVqaXJWMcG/RdiCt7GF3N3MXqoq
         cD1RfZmoX7evcXpWH3zsrlGlex3LxSHKRxIfzyyySgDXqd7Ef8/hynkH7NlKSCxlC/qy
         RS4aL45La0NBG9rBQZ2G+QxMKuY3BWiV+Sy6b/WpEUclq5IlgF45gM+IRnHC7mP/8J+y
         Qh7wC3BQugPIhDZnJhGCyE+Jv7u2UWhGuE/9OsvKPewgSIDns78t0QguZbDi9Nlcq4TO
         txiigMH+FdEFLULXWVdFDBsVNVwtujMUjIIdoxWGL+bV56AZKFNnYW47WarShcygIDmH
         9GKw==
X-Gm-Message-State: AOJu0Yw0ANjXZwtzDJkguxmqnr6Vnyydkx5Efjv5koFn2MDq5jILnZQn
	9auauedC0CmC2WJjnjUmv5s=
X-Google-Smtp-Source: AGHT+IEo8OAfPWEktKMivKvhtgoDHKwvxythYXL179zpbTtMYmD2w6YdRdxd0nPaYjk3FRGKDLz64g==
X-Received: by 2002:a2e:8295:0:b0:2c5:1d95:f7a1 with SMTP id y21-20020a2e8295000000b002c51d95f7a1mr708686ljg.27.1698359152188;
        Thu, 26 Oct 2023 15:25:52 -0700 (PDT)
Received: from skbuf ([188.26.57.160])
        by smtp.gmail.com with ESMTPSA id er14-20020a05600c84ce00b004064cd71aa8sm106688wmb.34.2023.10.26.15.25.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Oct 2023 15:25:50 -0700 (PDT)
Date: Fri, 27 Oct 2023 01:25:48 +0300
From: Vladimir Oltean <olteanv@gmail.com>
To: Justin Stitt <justinstitt@google.com>
Cc: GR-Linux-NIC-Dev@marvell.com, UNGLinuxDriver@microchip.com,
	linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
	intel-wired-lan@lists.osuosl.org, oss-drivers@corigine.com,
	linux-hyperv@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, bpf@vger.kernel.org
Subject: Re: [PATCH next v2 1/3] ethtool: Implement ethtool_puts()
Message-ID: <20231026222548.rqbp5ktgo2mysl6w@skbuf>
References: <20231026-ethtool_puts_impl-v2-0-0d67cbdd0538@google.com>
 <20231026-ethtool_puts_impl-v2-1-0d67cbdd0538@google.com>
 <20231026220248.blgf7kgt5fkkbg7f@skbuf>
 <CAFhGd8rWOE8zGFCdjM6i8H3TP8q5BFFxMGCk0n-nmLmjHojefg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAFhGd8rWOE8zGFCdjM6i8H3TP8q5BFFxMGCk0n-nmLmjHojefg@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231026_152556_476123_3D6F12D4 
X-CRM114-Status: UNSURE (   7.92  )
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

On Thu, Oct 26, 2023 at 03:09:59PM -0700, Justin Stitt wrote:
> Should I undo this? I want my patch against next since it's targeting
> some stuff in-flight over there. BUT, I also want ethtool_puts() to be
> directly below ethtool_sprintf() in the source code. What to do?

(removing everyone except the lists from CC, I don't want to go to email
arest because of spamming too many recipients)

What is the stuff in-flight in next that this is targeting?

And why would anything prevent you from putting ethtool_puts() directly
below ethtool_sprintf()?

