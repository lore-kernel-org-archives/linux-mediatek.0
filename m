Return-Path: <SRS0=9FsO=BR=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.5 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A1E2BC433E0
	for <linux-mediatek@archiver.kernel.org>; Fri,  7 Aug 2020 15:02:23 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 672DC2075D
	for <linux-mediatek@archiver.kernel.org>; Fri,  7 Aug 2020 15:02:23 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="eCipNN7/";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=web.de header.i=@web.de header.b="CtVjgL7s"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 672DC2075D
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=web.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Date:Message-ID:From:Subject:To:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Paa7EB54+luYodOFcxFUFOP+VUgBDzq7m42uOoWHN0E=; b=eCipNN7/kGsOQS+7/tAMYy++OT
	gU+/g5yd0dvnXMqdW6D35TA71xzZYMqI0IZAkXkY8+2kXJl/FjWcsO8zNk/OVqzAWWBXpEXb/raXI
	1Xr72iFQ2UIwxW7U8Pd/ad8nXSFSDqx6t6fEE26YhgzTx+5hJC+sHMMZt9NEFFFxG1SlbHtdi9T7r
	LtRqHtyzY25pW1kkhrgTgOLb9MWVqArmQYbsbw4w1Wx/qfFR0lps1S7He5eZH+b9p5tZx/fJcMaa3
	Zj7wPvrdKVOsNKi8BLxvRbKfPDyvB2lTLy+R3cQLlSAkIQV8+XjxvYkfKtird9f+IMhx0OHfzNd8z
	XVYzwxfw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k43sq-0001iw-3R; Fri, 07 Aug 2020 15:02:12 +0000
Received: from mout.web.de ([217.72.192.78])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k3yqn-0003tS-50; Fri, 07 Aug 2020 09:39:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=web.de;
 s=dbaedf251592; t=1596793178;
 bh=bHUbC5x7DBk25tFkz4V1HivlQKOcBSgaxF8kVZf5gHE=;
 h=X-UI-Sender-Class:To:Cc:Subject:From:Date;
 b=CtVjgL7sondToRiBGFsy0SO10Sn4Edx3mW00TGUxcMRkwKiqkAEyrCaNZr5WwMkM1
 C+coDpJlT+93FcF4ZXziOBow8Ln3ME9Z3Dp8C/BTfLKjruyXQLHC2hrlpdGES+3VHM
 30uqiJ3cjQnGv4WR2LT8y35wX/Y3QK/t5nG3+skM=
X-UI-Sender-Class: c548c8c5-30a9-4db5-a2e7-cb6cb037b8f9
Received: from [192.168.1.2] ([78.49.50.216]) by smtp.web.de (mrweb106
 [213.165.67.124]) with ESMTPSA (Nemesis) id 1MRF3W-1kOvOB3ia4-00NCCP; Fri, 07
 Aug 2020 11:33:32 +0200
To: Can Guo <cang@codeaurora.org>, Stanley Chu <stanley.chu@mediatek.com>,
 kernel-team@android.com, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-scsi@vger.kernel.org
Subject: Re: [PATCH 9/9] scsi: ufs: Properly release resources if a task is
 aborted successfully
From: Markus Elfring <Markus.Elfring@web.de>
Autocrypt: addr=Markus.Elfring@web.de; prefer-encrypt=mutual; keydata=
 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 FEE=
Message-ID: <a752927b-dd9b-ebf0-8c77-e2ae0b2aa475@web.de>
Date: Fri, 7 Aug 2020 11:33:26 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
Content-Language: en-GB
X-Provags-ID: V03:K1:aQ42aDV+xHzXH7ow97XdFEkaCI2k+qC+56+8kDH/G3Yms7MHBbq
 0GGmhB9uQ0wwNxFOrBpEQerh7/r1Zzj0vVwx7/gSnz7wO9rqJSeHHidC9l2Ta9NycwjjGdu
 jFltoEUqMg+OYLq5Ikwvo8qIsKEfTYeDtQ32/sHtFRN7VsrSiQnE/JOcc8tZvf4hKISRQc3
 uLUhp6qq5gp9/VmAOweww==
X-UI-Out-Filterresults: notjunk:1;V03:K0:ULcE1y7gjkU=:y1YMWL0MJTeGEwbY+o3eKU
 a93+ePsBe1qAv7/BwHexHPJvYH7HPIk6NDNAxvfsFDIEbfNhLLOw57IIUmv+LNdk/Fp13KLTE
 VPCyN33RhG/OEMfDy+7d3RJxNizlmdwXdRno4/OARX0dEbOuhSBDM8Nd5+dIHHBeVbV20wTbT
 M8b7VFhwO8jW8G6yahhs0eksb6rDzdGAvAC6uRLcoZQtm1EJvjc/RPSr9a2nX0xsFQ+IR3Bqt
 qLkLXspJciBuk5lOHcKqZtQspOTmzW/CX2M8S8XKJqar107TboKRPi2FahH4W1e5P4BnwTAAy
 CSlZjGPmHrK5MgdgrhhHvRQbM3bjBV+Ewbh6ExAo98u3nS0gb+m98WooDx19nGlq0qfcmQV0R
 n+E33kr4KcjJilH+6INZJgF80zgxtlIlmzsBw639iEM1hSFaqhqdLDzZIW06EXSK2xLmfu63j
 0O98DKfrxov0Gb6h/OnYw84LCaEwM9cCbdYoYI5se/gZbh7adTgym2+qSaNT+KTP0VNKqFkxB
 03iijpfe2IrhxS//2TiYgNu5AHxcOoc2zkCmuKehvTLQjvD6gIh8682A0V3WcKvoWrzed/l5f
 2uKqxD3cnkr2eSTh/8N5lMXWeLZXSC3dC3HzVOwii2sVKD8TBXtYQE+XQqYi1ew931aFZyxhg
 6lB6BuDmv5hsFO77gWSk2PTA+gAgf53moNwYAI74VqJJVj5fz64hmqvpLGEWWhq0mXBzHqb20
 yXRZh/Bxf3ocT007q+HHJBCPmUxLxwFCzHeMjbZxGPDfOjPt4e0e2ZoMVlH2uiJif2gJoFdpo
 lP1DjJbu+3DwpkPUnCT3tjSu7blAybDTyINTNO0b4C9WlmdaMIzhxYCSrO/gD5h7Kyh5+bXcO
 W5x2/WMNRoaK8VIHpzWIsOhjiFb7z2+ZWa4TF1MT9dYHb7Xp8Wmn6Fy1S4+SAy0zVV4yiBdkF
 MgxqHWR5bj5qPFN5KfaBJwTcBvFPTsRgSyw/B1EVRAvsnp7RhHAZJ5fyZe42Hij0S3PJAWtmS
 aPmB2rgVk8GazrfidXQJ5qe6weMVNA4QknMQg+u4EPxwET1eMqUO2JwTY9Q4vwuERKYram/b5
 U1xu6E0V6LzZoey08sWGMwOGeU3Nc3sUsWr4pSXvVSrK6UjGzI9RW0eOegQKl+dt4sUnCssKi
 A7MUwU1oNaAYZRFQizGL4I3YXjEcOo0Q3cttpNJUVPwGEe/kJHjQFxqdafraEXutHrea+9ruP
 wI2smWCo1hH2uX4xq1k804SkK3OZ1KEI9MMwaKw==
X-Bad-Reply: 'Re:' in Subject but no References or In-Reply-To headers
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200807_053945_507154_7297F3F5 
X-CRM114-Status: UNSURE (   7.82  )
X-CRM114-Notice: Please train this message.
X-Mailman-Approved-At: Fri, 07 Aug 2020 11:02:09 -0400
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Cc: Rajendra Nayak <rnayak@codeaurora.org>,
 Bart Van Assche <bvanassche@acm.org>,
 "Martin K. Petersen" <martin.petersen@oracle.com>,
 Saravana Kannan <saravanak@google.com>,
 "James E. J. Bottomley" <jejb@linux.ibm.com>, kernel-janitors@vger.kernel.org,
 "Bao D. Nguyen" <nguyenb@codeaurora.org>, linux-kernel@vger.kernel.org,
 Avri Altman <avri.altman@wdc.com>, Mark Salyzyn <salyzyn@google.com>,
 Alim Akhtar <alim.akhtar@samsung.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, Bean Huo <beanhuo@micron.com>,
 Hongwu Su <hongwus@codeaurora.org>, Asutosh Das <asutoshd@codeaurora.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

PiDigKYgVG8gZml4IGl0LCDigKYKCkkgcHJvcG9zZSB0byByZXBsYWNlIHRoaXMgd29yZGluZyBi
eSB0aGUgdGFnIOKAnEZpeGVz4oCdLgoKCj4g4oCmICJtYW5udWFsbHkiLCDigKYKClBsZWFzZSBh
dm9pZCBhIHR5cG86CuKApiAibWFudWFsbHkiLCDigKYKCgpSZWdhcmRzLApNYXJrdXMKCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4LW1lZGlhdGVr
IG1haWxpbmcgbGlzdApMaW51eC1tZWRpYXRla0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9s
aXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbWVkaWF0ZWsK
