From: Chuanhong Guo <gch981213@gmail.com>
Subject: Re: [PATCH] spi: mediatek: Attempt to address style issues in
 spi-mt7621.c
Date: Thu, 14 Mar 2019 10:26:47 +0800
Message-ID: <CAJsYDVKwJZmaLMkzYOeGnhnor7rXe21Xwvogx7aPfzfXOdqZAg@mail.gmail.com>
References: <20190313122403.248873-1-armax@google.com>
 <eb85ea17-babd-fe3a-f0ff-9c7f13498bd1@gmail.com>
 <CAJsYDVKF-3jZo4E3EMiYOqeWXVLu0hBra6Qp0sFoCz8y=BAjSw@mail.gmail.com>
 <4789d739-d2b5-357b-b9d8-bfaf587d33fc@gmail.com>
 <4172ce05-8dfc-c956-6af0-47c8367c215e@denx.de>
 <87y35ipgkt.fsf@notabene.neil.brown.name>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <87y35ipgkt.fsf@notabene.neil.brown.name>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: NeilBrown <neil@brown.name>
Cc: sankalpnegi2310@gmail.com, devel@driverdev.osuosl.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-kernel@vger.kernel.org, Armando Miraglia <arma2ff0@gmail.com>, Armando Miraglia <armax@google.com>, linux-mediatek@lists.infradead.org, John Crispin <john@phrozen.org>, Matthias Brugger <matthias.bgg@gmail.com>, Stefan Roese <sr@denx.de>, linux-arm-kernel@lists.infradead.org
List-Id: linux-mediatek@lists.infradead.org

Hi!
On Thu, Mar 14, 2019 at 6:14 AM NeilBrown <neil@brown.name> wrote:
>
> [...]
> My only small concern is that this driver was backported to openwrt
> (4.14 based) and then reverted
>
> https://github.com/openwrt/openwrt/commit/749a29f76ca780d8df70a5163d43bbdc6f13ba3f
>
>  "This breaks some mt7621 devices."
>
> Possibly it was backported badly, or possibly there is a problem.
Last time I backported the version with broken SPI modes so it got
broken SPI CS1 support. There is one mt7621 router using SPI CS1 in
OpenWrt and the backported driver broke it.
It has been fixed by my two "drop broken spi modes" patches.
>
> John: do you have any more details of the problem other than what is in
> the commit message?
>
> Thanks,
> NeilBrown

Regards,
Chuanhong Guo
