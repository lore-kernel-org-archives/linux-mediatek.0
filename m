From: Joe Perches <joe@perches.com>
Subject: Re: [PATCH] mt76: convert to DEFINE_SHOW_ATTRIBUTE
Date: Wed, 05 Dec 2018 10:09:03 -0800
Message-ID: <a8daff3575d4682107dede1f07bf98470acb98ff.camel@perches.com>
References: <20181203134028.12645-1-tiny.windzz@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20181203134028.12645-1-tiny.windzz@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Yangtao Li <tiny.windzz@gmail.com>, davem@davemloft.net, kubakici@wp.pl, matthias.bgg@gmail.com, nbd@nbd.name, lorenzo.bianconi@redhat.com, sgruszka@redhat.com, kvalo@codeaurora.org
Cc: linux-wireless@vger.kernel.org, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
List-Id: linux-mediatek@lists.infradead.org

On Mon, 2018-12-03 at 08:40 -0500, Yangtao Li wrote:
> Use DEFINE_SHOW_ATTRIBUTE macro to simplify the code.

Thanks.

Are you doing these manually or using some script?
