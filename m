Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AE09FC433EF
	for <linux-mediatek@archiver.kernel.org>; Wed, 11 May 2022 03:11:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=uQJGGI5mj5RFH5NpXUMZdiIxXuPtLbD5UAAuJ4540qM=; b=3yEeOoZGJrWXQT
	g8bN/bLj88TeVZE8kklBGDwYRhPUtHbdE84UtCfBJJMdulGWCCe3DcJTYbID1ztcD9yNGemCMcDO2
	BeR6b4flmqCMpJXq3Y7Qnfe6oZVhSDXZezepOM7XJTjxeMByYNsTwAayrdZ0yH70I2cxGYtUqrU6w
	b9yj2Ju3tgEG8fq/L+DtmqVXV4b+RFt5y9Vhpl3ZNQ7FESwUu46rTKxpaNEZSUuefP7A6ZmZfQQC9
	dV5n7bG+HursPeEjJTwr5FFMX+00IvJOpeyN0oiG5/39TImElmdE1/9fKHcvwYSnaErYHSr05SuXT
	7Hq0XzTqOreq8bRgAkgA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1noclI-004xEo-W1; Wed, 11 May 2022 03:11:41 +0000
Received: from mail-pf1-x435.google.com ([2607:f8b0:4864:20::435])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nocl6-004xAY-Jb
 for linux-mediatek@lists.infradead.org; Wed, 11 May 2022 03:11:31 +0000
Received: by mail-pf1-x435.google.com with SMTP id p8so815957pfh.8
 for <linux-mediatek@lists.infradead.org>; Tue, 10 May 2022 20:11:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=/x6uo1YySXVMLYO/GR/TQls5y6E3sKPi/YP3GhypGFk=;
 b=Ss4NkiyqC3bq8cAuffyQ0iwYDABhyU2Bmtws0Zju/x5ERdtwcC7kR2Yu87c3VuIEMK
 Us/T8zJF69f8JhtbzOnWhlkgyDPbnKmb7cAjhTh8x9mOSCQCo54/SoKNIjhP2UWbxKrd
 OhmjNkM2VQLEoTQxnIH6fIGpsOO/mb887TqU5x4JfO7BkiARzqNWh1dLHMbbjn2AKs2i
 Yr1nBfWNwwyz0TNZQJlo4nM/SVRIV7C28eZg2asClU6v9zEecf+z/IhjBSBT9IPtjGAC
 dhEorDpsEc5Q3azs/y6HXiDKqBKwlMiQt7uffoM/b2w3dfq8fDgAgY+sHRq3mFbFG2bx
 DLSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=/x6uo1YySXVMLYO/GR/TQls5y6E3sKPi/YP3GhypGFk=;
 b=yDN5j4YrzGHO6j4pUuELrO6LZt7DfBzNniKa0E5s79GOStDlKoDCQgpEpnNz81AcIa
 sW5a9jlJXB3cv4gMVNuav/fQKMBRGXE1NTULppWUNa/+F7zsPMmn2p8TSRUNL1vtF1k/
 HiJmfoNqjWVfA1BDK3vHLEkzBqVgCgA7inVmP97npH7KQ3awYIIAMaOBtQlApQ5PuCBq
 PvNBB4MQkPvKisgUcYGsFYB/2SjplF7bqWnPWVUdGk1G4JPXcA+cO6dkw5i0L0Yl94OD
 NkQ2kpARFFEvd1T9UZntfkVD+h+BA2SzhiVgAWuvpyHe4RsZHdSeTmTGH9gEx4cPeNM4
 VAVw==
X-Gm-Message-State: AOAM531mQMJZiOS187XduUfNEtCSFozPuIXOwKLYe9BGVwuMxxZQw7f8
 t8OX9B3CR0EoDVGUnYTrSehRZQ==
X-Google-Smtp-Source: ABdhPJxnKGmk6n2YenuG5EAv9qkr4u4nbDHBXiTYS9Yf0cFdI8i1GC36oqUHBwKgp7qcqEn/BpQGzw==
X-Received: by 2002:a62:6dc3:0:b0:505:895a:d38b with SMTP id
 i186-20020a626dc3000000b00505895ad38bmr23391446pfc.7.1652238686017; 
 Tue, 10 May 2022 20:11:26 -0700 (PDT)
Received: from localhost ([122.162.234.2]) by smtp.gmail.com with ESMTPSA id
 25-20020a17090a191900b001cd4989ff42sm438581pjg.9.2022.05.10.20.11.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 10 May 2022 20:11:25 -0700 (PDT)
Date: Wed, 11 May 2022 08:41:22 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Rex-BC Chen <rex-bc.chen@mediatek.com>
Cc: Jiabing Wan <wanjiabing@vivo.com>, "Rafael J. Wysocki" <rafael@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Jia-Wei Chang <jia-wei.chang@mediatek.com>,
 "Andrew-sh.Cheng" <andrew-sh.cheng@mediatek.com>,
 linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
Subject: Re: [PATCH v2] cpufreq: mediatek: Fix potential deadlock problem in
 mtk_cpufreq_set_target
Message-ID: <20220511031122.kkotwq7co2vx5zqp@vireshk-i7>
References: <20220510090531.12438-1-wanjiabing@vivo.com>
 <20220510091212.olrvvjlx4jtm7zw2@vireshk-i7>
 <49566544-e8f2-ef38-288e-fcd276d87d3b@vivo.com>
 <20220510092822.j3z6bydurg7x5bu4@vireshk-i7>
 <0181c505dd94c599b270f159ca93442a4afe1760.camel@mediatek.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <0181c505dd94c599b270f159ca93442a4afe1760.camel@mediatek.com>
User-Agent: NeoMutt/20180716-391-311a52
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220510_201128_674467_E665FB8F 
X-CRM114-Status: GOOD (  10.26  )
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

On 10-05-22, 19:23, Rex-BC Chen wrote:
> I am not sure what's the problem.
> But I subscribed the linux-arm-kernel mailing list and linux-mediatek.
> 
> As for LKML, do you mean subscribe "List: linux-kernel;" in [1]?

Yes, this is one of the most useful email lists and mostly gets cc'd anyway, you
can disable mail delivery if you don't want to get emails.

I asked because I couldn't find your email in https://lore.kernel.org/lkml, but
its fine either way.

-- 
viresh

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
