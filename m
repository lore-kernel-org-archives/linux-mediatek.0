Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5B71BC4167B
	for <linux-mediatek@archiver.kernel.org>; Thu,  7 Dec 2023 20:01:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Type:MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To
	:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BxKQalM2XsdeZ6LbLxJy5cCkk6wpAYdzkOBgji/EH9U=; b=wPdTj/ACtyiSIMjcxAl5fSU3/Q
	2ORXuTP4XqPm13vtL7bC6/SNxdZ1UfR0mY3JW77gi73udIg7GmcVcSAkMHf9ClKqO/HzeCPDsEtVB
	JZwGw9MeUrbzadAWAkGgHLZ9KYiICkEkENCIRJK+KRyUmVEsTuOvgu1bPsSdtaPKx9v2qqwTkOWZa
	J2Gn0nwQGH3jYNDk/rBxfrhiUVWe8DPXf/FT2BAVoCkcQL+GRw0t4yMchRudH1YeUcULtZIWj0Uo5
	43awVd5gb2Rd0SkxttaNk+AVElJRou1cTGq7AeSFWJWLIa9RIu5Zc8es+jArX4aHMrNbNmp3b4lvO
	xqNBDMxQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rBKZ4-00DoHf-34;
	Thu, 07 Dec 2023 20:01:42 +0000
Received: from mail-ej1-x634.google.com ([2a00:1450:4864:20::634])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rBKZ1-00DoGI-1S;
	Thu, 07 Dec 2023 20:01:40 +0000
Received: by mail-ej1-x634.google.com with SMTP id a640c23a62f3a-a1e7971db2aso151291366b.3;
        Thu, 07 Dec 2023 12:01:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1701979296; x=1702584096; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=BxKQalM2XsdeZ6LbLxJy5cCkk6wpAYdzkOBgji/EH9U=;
        b=IOFr7lxq9vV4fqkbsy7frZIJAF6VGzPbmAQjj7aKNjtM80NGLuM4DjtpJleVzIuuxO
         LYnCXY5F7gZRJbE4ex0RsMJyZegmk4dNIsfA1C2b0zWkJViMDYiiQ64xz5GJT8re2QUh
         O3aa+USZcn38Z4RHmkAplUMWTW4TVYFK0Cj30K+nVOdXvt/YCInkq6HhO+9w3ZquDUcj
         dVT8FkRncw0lcdxDih9WtCQazsVsDwKcFt4eMRY28qgQUvWSNDwHn3NHGKXkSBSS2h8i
         XctS242znWQq57RhDV7OAjr5UT9Owj/2aHP3TGTVMBGORxKWbJ2iCQ7a0l1vj68Cl+fl
         8exQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701979296; x=1702584096;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BxKQalM2XsdeZ6LbLxJy5cCkk6wpAYdzkOBgji/EH9U=;
        b=ULgwO0NmJWoAHN1ZDw2WlbU3W9vLog2reVMO0UWfrY28rnTU00vykaM2Xf1DKquf8h
         x19+zZjilc13KI33O+P321EWBro5QD6pXpJZZu/Kl5VmA5k6dmwtG74Tba2BS/29bZDr
         3zHmEv+mRjGPHPnlDEPGtUaTnjc0OJ+Y1ad2XZEJkpcOJ3o69Sp/O0hZ5vsPRaAQQtPO
         mo65FoehFatpMVuJyHBVYtEg00HU9kv0XiIK0keFZyWGywIXqqaK92MvsMkFkouGKIoY
         AqcyZfIqDA1Bw0GUy8TnU82SkXkm6WcapWPpSairJu2VXsmoNk1o3mtCyfU9b6o450og
         ePxQ==
X-Gm-Message-State: AOJu0Yz1MzfXMHtiXvphDCGUQmIvz31M3q+m5Zi8rEg3QJmJNqcncuWy
	VDzPnO04PDu7CO7T5qFBwZg=
X-Google-Smtp-Source: AGHT+IHjp1aCJEXZp+EHs5Gft8fX73EKJgH1YZLg6gizzxEd99zvXmS2xooHm5ZJUX0mJmsyTvN7pQ==
X-Received: by 2002:a17:906:5185:b0:a19:a19a:ea9a with SMTP id y5-20020a170906518500b00a19a19aea9amr1705134ejk.83.1701979295685;
        Thu, 07 Dec 2023 12:01:35 -0800 (PST)
Received: from skbuf ([188.27.185.68])
        by smtp.gmail.com with ESMTPSA id cu12-20020a170906ba8c00b00a10f3030e11sm141937ejd.1.2023.12.07.12.01.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 Dec 2023 12:01:35 -0800 (PST)
Date: Thu, 7 Dec 2023 22:01:32 +0200
From: Vladimir Oltean <olteanv@gmail.com>
To: =?utf-8?B?QXLEsW7DpyDDnE5BTA==?= <arinc.unal@arinc9.com>
Subject: Re: [PATCH net-next 07/15] net: dsa: mt7530: do not run
 mt7530_setup_port5() if port 5 is disabled
Message-ID: <20231207200132.772h3t3l6coan6ht@skbuf>
References: <20231118123205.266819-1-arinc.unal@arinc9.com>
 <20231118123205.266819-8-arinc.unal@arinc9.com>
 <20231121185358.GA16629@kernel.org>
 <a2826485-70a6-4ba7-89e1-59e68e622901@arinc9.com>
 <90fde560-054e-4188-b15c-df2e082d3e33@moroto.mountain>
 <20231207184015.u7uoyfhdxiyuw6hh@skbuf>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231207184015.u7uoyfhdxiyuw6hh@skbuf>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231207_120139_496312_795ECB33 
X-CRM114-Status: GOOD (  10.77  )
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
Cc: Andrew Lunn <andrew@lunn.ch>, Daniel Golle <daniel@makrotopia.org>, Eric Dumazet <edumazet@google.com>, mithat.guner@xeront.com, Dan Carpenter <dan.carpenter@linaro.org>, Florian Fainelli <f.fainelli@gmail.com>, erkin.bozoglu@xeront.com, Russell King <linux@armlinux.org.uk>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Landen Chao <Landen.Chao@mediatek.com>, Sean Wang <sean.wang@mediatek.com>, DENG Qingfang <dqfext@gmail.com>, linux-mediatek@lists.infradead.org, Bartel Eerdekens <bartel.eerdekens@constell8.be>, Matthias Brugger <matthias.bgg@gmail.com>, linux-arm-kernel@lists.infradead.org, AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, Simon Horman <horms@kernel.org>, "David S. Miller" <davem@davemloft.net>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Thu, Dec 07, 2023 at 08:40:15PM +0200, Vladimir Oltean wrote:
> Also, reducing the indentation level of for_each_child_of_node() by one
> can't be bad. Maybe even by more. There's this pattern:
> 
> for_each_child_of_node(dn, mac_np) {
> 	// do stuff with mac_np
> 	break;
> }
> 
> aka we only care about the first child of dn. We could find the mac_np
> as the only operation inside for_each_child_of_node(), break directly,
> and "do stuff with mac_np" could be done outside, further reducing the
> indentation by 1 level.

I noticed just now that there is further filtering on the child OF node
by of_device_is_compatible(). In that case, of_get_compatible_child()
could be used to eliminate for_each_child_of_node() completely.

